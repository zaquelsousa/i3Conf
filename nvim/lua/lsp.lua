--autoComplete

local cmp = require("cmp")

cmp.setup({

  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
})

--lsp's configuratiun
require'lspconfig'.lua_ls.setup{}

require'lspconfig'.gopls.setup{}
