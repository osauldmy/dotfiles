return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
    opts = {},
    event = "VeryLazy",
  },
  { "sindrets/diffview.nvim", opts = {}, event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim", config = true, event = "VeryLazy" },
}
