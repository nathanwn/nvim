return {
  "hrsh7th/nvim-cmp",
  version = "v0.0.1",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-omni" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "saadparwaiz1/cmp_luasnip" },
    -- Appearance
    { "onsails/lspkind.nvim" },
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-s>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = false, -- false == only confirm explicitly selected items
        }),
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },
      sources = cmp.config.sources({
        -- prioritise according to order
        { name = "nvim_lua" }, -- this source can detect whether it should turn on
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "omni" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 4 },
      }),
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          require("nathan-wien.plugins.cmp.comparators").disprioritise_underscore,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[nvim]",
            path = "[path]",
            luasnip = "[snip]",
            omni = "[omni]",
          },
        }),
      },
      experimental = {
        native_menu = false,
      },
      preselect = cmp.PreselectMode.None,
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline("/", {
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline", keyword_length = 3 },
      }),
    })

    -- NOTE: this has been done in `lsp/default.lua`
    -- Setup lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --   capabilities = capabilities
    -- }
  end,
}
