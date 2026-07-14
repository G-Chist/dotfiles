vim.g.mapleader = " " -- Set leader key before lazy.nvim

require("GChist.options")
require("GChist.lazy_init")
vim.cmd("colorscheme yowish")
-- require'nvim-treesitter'.install { 'rust', 'javascript', 'c', 'python', 'html', 'lua', 'bash', 'go' }

vim.keymap.set('n', 'K', function()
  if vim.bo.filetype ~= 'python' then return end
  local output = vim.fn.systemlist('ruff check ' .. vim.fn.expand('%'))
  vim.api.nvim_echo({ { table.concat(output, '\n') } }, true, {})
end, { desc = 'Ruff check current file' })

vim.keymap.set('n', '_', function()
  if vim.bo.filetype ~= 'python' then return end
  local file = vim.fn.expand('%')
  local fix = vim.fn.systemlist('ruff check --fix ' .. file)
  local fmt = vim.fn.systemlist('ruff format ' .. file)
  vim.cmd('edit!')
  local msg = table.concat(fix, '\n') .. '\n' .. table.concat(fmt, '\n')
  vim.api.nvim_echo({ { msg } }, true, {})
end, { desc = 'Ruff fix + format current file' })

vim.keymap.set('v', '<C-2>', '>', { desc = 'Indent selected lines' })
vim.keymap.set('v', '<C-4>', '<', { desc = 'Unindent selected lines' })
