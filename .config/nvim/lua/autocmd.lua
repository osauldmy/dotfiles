-- NOTE: nvim-tree is being very lazily loaded.
-- If I open nothing - it's fine
-- if I open some file - it's fine, tree will lazy load on background,
-- but when I open directory like `nvim .`, I want it immediately, so
-- instead of lazy, I just want normal loading.
-- When tree is not needed immediately, it saves startup time.
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- https://github.com/nvim-tree/nvim-tree.lua/issues/1981
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
    local is_a_directory = vim.fn.isdirectory(data.file) == 1
    if is_a_directory then
      vim.cmd("silent cd " .. data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
})

-- Remember folds on write/exit and restore them on opening
vim.api.nvim_create_autocmd({ "BufWinEnter" }, { pattern = "*.*", command = "silent! loadview" })
vim.api.nvim_create_autocmd({ "BufWinLeave" }, { pattern = "*.*", command = "mkview" })
