return {
  "mhartington/formatter.nvim",
  config = function()
    local ft = require("formatter.filetypes")
    local filetype_settings = {
      -- lua = { ft.lua.stylua },
      lua = {
        exe = "stylua",
        args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--column-width",
          "120",
          "--quote-style",
          "AutoPreferDouble",
          "--call-parentheses",
          "Always",
          "--",
          "-",
        },
        stdin = true,
      },
      python = {
        ft.python.black,
        ft.python.isort,
      },
      sh = { ft.sh.shfmt },
      dart = { ft.dart.dartformat },
      javascript = { ft.typescript.prettier },
      typescript = { ft.typescript.prettier },
      ["*"] = {
        ft.any.remove_trailing_whitespace,
        function()
          vim.lsp.buf.format({ async = true })
        end,
      },
    }

    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = filetype_settings,
    })
  end,
  event = "VeryLazy",
}
