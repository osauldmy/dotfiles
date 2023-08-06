return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  priority = 100,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "vim",
        "lua",
        "regex",
        "comment",
        "bash",
        "markdown",
        "markdown_inline",
        "python",
      },
      sync_install = false,
      disable = {},
      additional_vim_regex_highlighting = false,
      highlight = { enable = true },
    })
  end,
}
