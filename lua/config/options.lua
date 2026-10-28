vim.g.mapleader = " "
vim.g.maplocalleader = "," -- idris2 <localleader> keys depend on this

-- Absolute line numbers (LazyVim defaults to `relativenumber = true`).
vim.opt.relativenumber = false

-- LazyVim already sets number, signcolumn and clipboard (unnamedplus), so the
-- rest of the old options.lua is redundant.

-- Use Telescope for LazyVim's built-in finder keys (<leader>ff, <leader>fg, ...)
vim.g.lazyvim_picker = "telescope"
