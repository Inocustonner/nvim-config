local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  packer_bootstrap = true
  vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_path,
  })
  vim.cmd('packadd packer.nvim')
end

local init_src_path = debug.getinfo(1, 'S').source
local init_parent_dir = vim.fn.fnamemodify(init_src_path:sub(2), ':h')
vim.opt.runtimepath:append(init_parent_dir .. '/lsp')

require('config.options')
require('config.plugins')
require('config.keymaps')
require('config.commands')
require('config.diagnostics')
require('config.lsp_settings')

if packer_bootstrap then
  require('packer').sync()
end
