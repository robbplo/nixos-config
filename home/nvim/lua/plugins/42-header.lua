return {
  "Diogo-ss/42-header.nvim",
  opts = {
    default_map = true,
    auto_update = true,
    user = "rploeger",
    mail = "rploeger.student@codam.nl",
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
