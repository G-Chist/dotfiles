require("GChist")

vim.opt.updatetime = 300

vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'CocGroup',
  callback = function()
    if vim.bo.buftype == '' and vim.fn.exists('*CocActionAsync') then
      vim.fn.CocActionAsync('doHover')
    end
  end,
})
