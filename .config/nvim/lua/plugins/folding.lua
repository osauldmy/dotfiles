return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",
  config = function()
    vim.opt.mouse = "a"
    require("ufo").setup()
  end,
}
