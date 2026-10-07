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
  end,
  keys = {
    {
      "<leader>T",
      function() require("telescope.builtin").builtin() end,
      desc = "Telecope",
    },
    {
      "<leader>tt",
      function() require("telescope.builtin").pickers() end,
      desc = "Telecope previous pickers",
    },
    {
      "<leader>tp",
      function() require("telescope.builtin").find_files() end,
      desc = "Telecope find files",
    },
    {
      "<leader>tP",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = true
        })
      end,
      desc = "Telecope find files (hidden)",
    },
    {
      "<leader>tf",
      function() require("telescope.builtin").live_grep() end,
      desc = "Telecope live grep",
    },
    {
      "<leader>tF",
      function() require("telescope.builtin").live_grep({ no_ignore = true }) end,
      desc = "Telecope live grep (hidden)",
    },
    {
      "<leader>gs",
      function() require("telescope.builtin").git_status() end,
      desc = "Telecope git status",
    },
  },
}
