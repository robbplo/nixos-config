return {
  {
    'srcery-colors/srcery-vim',
    priority = 1000,
    init = function()
      vim.opt.termguicolors = true
      vim.opt.cursorline = true
      vim.g.srcery_italic = 1;
      vim.g.srcery_italic_types = 1;
      -- vim.cmd [[let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"]]
      -- vim.cmd [[let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"]]
      vim.cmd [[colorscheme srcery]]
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
