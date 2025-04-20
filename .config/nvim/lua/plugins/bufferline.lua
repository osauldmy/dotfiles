return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            -- highlight = "Directory",
            separator = true,
          },
        },
      },
    })
    vim.keymap.set("n", "<C-i>", vim.cmd.BufferLineCycleNext, { silent = true })
    vim.keymap.set("n", "<C-S-i>", vim.cmd.BufferLineCyclePrev, { silent = true })
  end,
}

-- TODO: maybe try https://github.com/romgrk/barbar.nvim
