return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  init = function()
    local trouble = require("trouble.sources.telescope")
    local telescope = require("telescope")
    telescope.load_extension('ui-select')

    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open },
          n = { ["<c-t>"] = trouble.open },
        },
      },
    }
  end
}
