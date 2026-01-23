vim.g.mapleader = " " -- Set leader key before Lazy
 
require("GChist.options")
require("GChist.lazy_init")
vim.cmd("colorscheme yowish")
require'nvim-treesitter'.install { 'rust', 'javascript', 'c', 'python', 'html', 'lua' }

vim.keymap.set('v', '<C-2>', '>', { desc = 'Indent selected lines' })
vim.keymap.set('v', '<C-4>', '<', { desc = 'Unindent selected lines' })
