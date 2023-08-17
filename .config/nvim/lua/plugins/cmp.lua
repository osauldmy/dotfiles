local function setup_cmp()
  require("luasnip.loaders.from_vscode").lazy_load()
  local cmp = require("cmp")

  cmp.setup({
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "emoji" },
      { name = "calc" },
      { name = "buffer" },
      { name = "latex_symbols", option = { strategy = 0 } },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      -- Tab+Ctrl+Shift
      ["<C-S-i>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),

      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-e>"] = cmp.mapping.abort(),

      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
    }),
    formatting = {
      format = function(entry, vim_item)
        local lsp_client = entry.source.source.client

        vim_item.kind = require("lspkind").symbolic(vim_item.kind, { mode = "symbol_text" })
        vim_item.menu = ({
          nvim_lsp = lsp_client ~= nil and lsp_client.name or "LSP",
          nvim_lua = "Lua",
          path = "Path",
          buffer = "Buffer",
          luasnip = "Snippets",
          calc = "Calc",
        })[entry.source.name] or entry.source.name
        vim_item.abbr = string.sub(vim_item.abbr, 1, 60) -- NOTE: makes completion suggestions windows narrower
        return vim_item
      end,
    },
    window = {
      --  completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = {
      { name = "path" },
      { name = "emoji" },
      { name = "calc" },
      { name = "buffer" },
    },
  })
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      "kdheepak/cmp-latex-symbols",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = setup_cmp,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    version = "2.*",
    build = "make install_jsregexp",
  },
}
