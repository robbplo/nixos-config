return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  event = 'VimEnter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    auto_install = true,
    highlight = { enable = true },
    indent = {
      enable = true,
      -- disable = { 'gdscript' },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    }
  },
  -- init = function()
  --   -- local nvim_treesitter = require('nvim-treesitter.configs')
  --   -- -- Experimental Laravel Blade support
  --   -- ---@diagnostic disable-next-line: inject-field
  --   -- require('nvim-treesitter.parsers').get_parser_configs().blade = {
  --   --   install_info = {
  --   --     url = 'https://github.com/EmranMR/tree-sitter-blade',
  --   --     files = { 'src/parser.c' },
  --   --     branch = 'main',
  --   --   },
  --   --   filetype = 'blade',
  --   -- }
  --   --
  --   -- vim.filetype.add({
  --   --   pattern = {
  --   --     [".*%.blade%.php"] = "blade",
  --   --   },
  --   -- })
  --
  --   -- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
  --   nvim_treesitter.setup
  -- end
}
