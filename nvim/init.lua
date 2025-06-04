vim.cmd([[
  call plug#begin()
  "lualine
  Plug 'nvim-lualine/lualine.nvim'
  " If you want to have icons in your statusline choose one of these
  Plug 'nvim-tree/nvim-web-devicons'
  "Tema
  Plug 'Tsuzat/NeoSolarized.nvim', { 'branch': 'master' }
  "Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  "LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'

  "Autocomplete
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  "File explorer
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'

  call plug#end()
]])


vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

 
require("nvim-tree").setup()
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- lsp configs
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "javascript", "typescript", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer" },
  automatic_installation = true,
})

-- LSP servers
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {}
lspconfig.rust_analyzer.setup {}

-- Autocomplete
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
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

--lualine configs
require('lualine').setup {
  options = {
    theme = 'NeoSolarized'
    -- ... your lualine config
  }
}


vim.wo.number = true

-- Tema: NeoSolarized
local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

-- Default Setting for NeoSolarized

NeoSolarized.setup {
	style = "Dark", -- "dark" or "light"
	transparent = true, -- true/false; Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
	styles = {
		-- Style to be applied to different syntax groups
		comments = { italic = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		string = { italic = true },
		underline = true, -- true/false; for global underline
		undercurl = true, -- true/false; for global undercurl
  },
  -- Add specific hightlight groups
  on_highlights = function(highlights, colors) 
    -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
  end, 
}
-- Set colorscheme to NeoSolarized
vim.cmd [[
   try
        colorscheme NeoSolarized
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
]]


--trocando a cor das pastas do tema pq larga e paia kkkk
vim.cmd [[
  highlight NvimTreeFolderIcon guifg=#3b82f6
  highlight NvimTreeOpenedFolderIcon guifg=#3b82f6
  highlight NvimTreeFolderName guifg=#3b82f6
]]

