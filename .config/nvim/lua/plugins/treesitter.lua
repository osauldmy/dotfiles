return {
  {
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
          -- NOTE: `comment` is commented out for now:
          --       significantly slows down nvim with long comments in the code
          -- "comment",
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
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },
}
