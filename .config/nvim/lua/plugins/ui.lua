return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#FFFFFF",
        render = "minimal",
        fps = 120,
        top_down = false,
      })
      vim.notify = notify
    end,
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    opts = {},
  },
}
