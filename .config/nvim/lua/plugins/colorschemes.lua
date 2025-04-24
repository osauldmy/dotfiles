-- Don't show default themes in picker
vim.opt.wildignore:append({
  "blue.vim",
  "darkblue.vim",
  "default.vim",
  "delek.vim",
  "desert.vim",
  "elflord.vim",
  "evening.vim",
  "industry.vim",
  "habamax.vim",
  "koehler.vim",
  "lunaperche.vim",
  "morning.vim",
  "murphy.vim",
  "pablo.vim",
  "peachpuff.vim",
  "quiet.vim",
  "ron.vim",
  "shine.vim",
  "slate.vim",
  "sorbet.vim",
  "retrobox.vim",
  "torte.vim",
  "unokai.vim",
  "vim.lua",
  "wildcharm.vim",
  "zaibatsu.vim",
  "zellner.vim",
})

return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
