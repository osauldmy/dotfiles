local make_transparent_background = function()
  vim.cmd([[
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
  ]])
end

return {
  {
    "ellisonleao/gruvbox.nvim",
    init = function()
      vim.cmd([[colorscheme gruvbox]])
      make_transparent_background()
    end,
  },
}
