local language_servers = {
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "html",
  "jsonls",
  "lua_ls",
  "ltex",
  "marksman",
  -- "pylsp",
  -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
  -- :PyLspInstall pyls-flake8 pylsp-mypy pyls-isort python-lsp-black python-lsp-ruff
  "pyright",
  "ruff_lsp",
  "taplo", -- toml
  "vimls",
  "yamlls",
}

local on_attach = function(_, bufnr)
  -- <C-x> <C-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { buffer = bufnr, noremap = true, silent = true }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set("n", "<space>K", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  -- vim.keymap.set("n", "<space>rn", ":IncRename")

  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
  --
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true, timeout = nil })
  end, opts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts) -- help etc
end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- https://www.reddit.com/r/neovim/comments/gtta9p/comment/hwni7j2/
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false, -- please no, distracts so much
  signs = true, -- is more than enough, can look into the message with <space>e
  update_in_insert = false,
  underline = true,
})

local setup_lsps = function()
  require("mason-lspconfig").setup({
    ensure_installed = language_servers,
  })
  local lspconfig = require("lspconfig")

  require("mason-lspconfig").setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
    --
    ["pylsp"] = function()
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              rope_autoimport = { enabled = true },
              pycodestyle = {
                maxLineLength = 120,
              },
            },
          },
        },
      })
    end,
    --
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            telemetry = { enable = false },
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
    --
  })
end

return {
  -- { "folke/neodev.nvim", opts = {}, event = "VeryLazy" },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    opts = {
      max_concurrent_installers = 10,
      ui = {
        check_outdated_packages_on_open = true,
        width = 0.6,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    lazy = false,
    config = setup_lsps,
  },
}
