-- LSP and autocomplete
return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      local lspconfig = require('lspconfig')

      -- Diagnostic signs
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- Show line diagnostics automatically in hover window
      vim.cmd(
        [[ autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false }) ]])

      -- Add additional capabilities supported by nvim-cmp
      -- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.preselectSupport = true
      capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
      capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
      capabilities.textDocument.completion.completionItem.deprecatedSupport = true
      capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
      capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          'documentation',
          'detail',
          'additionalTextEdits',
        },
      }

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Highlighting references
        if client.server_capabilities.document_highlight then
          vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', '<cmd>Trouble lsp_implementations<cr>', opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>Trouble lsp<cr>', opts)
      end

      ---- Auto formatting
      -- Switch for controlling whether you want autoformatting.
      --  Use :KickstartFormatToggle to toggle autoformatting on or off
      local format_is_enabled = true
      vim.api.nvim_create_user_command('KickstartFormatToggle', function()
        format_is_enabled = not format_is_enabled
        print('Setting autoformatting to: ' .. tostring(format_is_enabled))
      end, {})

      -- Disable formatting automatically for certain filetypes
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'c', 'cpp', 'h' },
        callback = function()
          format_is_enabled = false
        end,
      })

      -- Create an augroup that is used for managing our formatting autocmds.
      --      We need one augroup per client to make sure that multiple clients
      --      can attach to the same buffer without interfering with each other.
      local _augroups = {}
      local get_augroup = function(client)
        if not _augroups[client.id] then
          local group_name = 'kickstart-lsp-format-' .. client.name
          local id = vim.api.nvim_create_augroup(group_name, { clear = true })
          _augroups[client.id] = id
        end

        return _augroups[client.id]
      end

      -- Whenever an LSP attaches to a buffer, we will run this function.
      --
      -- See `:help LspAttach` for more information about this autocmd event.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
        -- This is where we attach the autoformatting for reasonable clients
        callback = function(args)
          local client_id = args.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)
          local bufnr = args.buf
          if client == nil then
            error('lsp client is nil')
          end

          -- Only attach to clients that support document formatting
          if not client.server_capabilities.documentFormattingProvider then
            return
          end

          -- Tsserver usually works poorly. Sorry you work with bad languages
          -- You can remove this line if you know what you're doing :)
          if client.name == 'tsserver' then
            return
          end

          -- Create an autocmd that will run *before* we save the buffer.
          --  Run the formatting command for the LSP that has just attached.
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              if not format_is_enabled then
                return
              end

              vim.lsp.buf.format {
                async = false,
                filter = function(c)
                  return c.id == client.id
                end,
              }
            end,
          })
        end
      })

      -- Define `root_dir` when needed
      -- See: https://github.com/neovim/nvim-lspconfig/issues/320
      -- This is a workaround, maybe not work with some servers.
      -- local root_dir = function()
      --   return vim.fn.getcwd()
      -- end

      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches.
      -- Add your language server below:
      local servers = {
        'bashls',
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        'eslint',
        'gdscript',
        'glsl_analyzer',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'ocamllsp',
        'phpactor',
        'nixd',
        'rust_analyzer',
        'ts_ls',
        'yamlls',
        'hls',
        'clangd',
        'basedpyright',
      }

      -- Call setup
      for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
        vim.lsp.enable(lsp)
      end

      vim.lsp.config('gleam', {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'gleam', 'lsp' }
      })
      vim.lsp.enable('gleam')

      vim.lsp.config('lexical', {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'lexical' },
        root_dir = function(fname)
          return lspconfig.util.root_pattern('mix.exs', '.git')(fname) or vim.loop.cwd()
        end,
        filetypes = { 'elixir', 'eelixir', 'heex' },
        -- optional settings
        settings = {}
      })
      vim.lsp.enable('lexical')
    end
  },
  {
    'williamboman/mason.nvim',
    opts = {},
  }
}
