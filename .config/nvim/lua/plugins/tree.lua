vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<C-t>", ":NvimTreeToggle<CR>", desc = "Toggle tree" },
  },
  opts = {},
  event = "VeryLazy",
}
