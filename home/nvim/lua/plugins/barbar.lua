return {
  'romgrk/barbar.nvim',
  event = 'VimEnter',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  opts = {
    focus_on_close = "right",
  },
  init = function()
    -- disable auto-setup
    vim.g.barbar_auto_setup = false
  end,
}
