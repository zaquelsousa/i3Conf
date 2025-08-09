print("zakk my configs lol")

require('nvim-web-devicons').setup {
  default = true;
}



require("ztree-lua.ztree")

require("lsp")

-- Configuração opcional (antes de aplicar o tema)
-- Ativando o tema
vim.cmd[[colorscheme tokyonight-moon]]

-- keybinds
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- some ui confs
vim.opt.number = true
vim.opt.relativenumber = true

