-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
autocmd({ 'TextChanged', 'InsertLeave' }, {
  desc = 'Autosave on some actions',
  group = augroup('autosave', { clear = true }),
  command = 'silent! wall',
  nested = true,
})