return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    { "<C-p>", "<cmd>ToggleTerm<CR>" },
    { "<C-P>", "<cmd>ToggleTerm direction=float<CR>" },
  },
}
