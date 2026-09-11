return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      lazy = false,
      init = function()
        -- Built-in ftplugin mappings can otherwise override textobject motions.
        vim.g.no_plugin_maps = true
      end,
      opts = {
        select = { lookahead = true },
        move = { set_jumps = true },

      },
    },
  },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter')
    treesitter.setup({})

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TreesitterFeatures', { clear = true }),
      callback = function(event)
        local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if not lang then
          return
        end

        local function enable()
          if not vim.api.nvim_buf_is_valid(event.buf)
            or vim.treesitter.language.get_lang(vim.bo[event.buf].filetype) ~= lang then
            return
          end
          -- Some filetypes have no parser; keep their standard highlighting and indent.
          if pcall(vim.treesitter.start, event.buf, lang) then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end

        if vim.tbl_contains(treesitter.get_available(), lang)
          and not vim.tbl_contains(treesitter.get_installed(), lang) then
          treesitter.install({ lang }):await(vim.schedule_wrap(enable))
        else
          enable()
        end
      end,
    })
  end,
}
