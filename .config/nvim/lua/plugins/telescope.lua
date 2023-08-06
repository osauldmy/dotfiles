-- TODO: customize further
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<space>ff", telescope_builtin.find_files)
    vim.keymap.set("n", "<space>fg", telescope_builtin.live_grep)
  end,
}
