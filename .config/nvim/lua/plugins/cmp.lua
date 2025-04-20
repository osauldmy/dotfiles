-- Other alternatives to nvim-cmp to try
-- https://github.com/Saghen/blink.cmp
-- https://github.com/ms-jpq/coq_nvim

local function setup_cmp()
  local cmp = require("cmp")

  cmp.setup({
    preselect = cmp.PreselectMode.None,
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
      { name = "path" },
      { name = "buffer" },
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
      format = function(_, vim_item)
        vim_item.kind = require("lspkind").symbolic(vim_item.kind, { mode = "symbol_text" })
        return vim_item
      end,
    },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = {
      { name = "path" },
      { name = "buffer" },
    },
  })

  cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
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
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind.nvim",
    },
    config = setup_cmp,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
