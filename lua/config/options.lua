vim.g.mapleader = " "
vim.g.maplocalleader = "," -- idris2 <localleader> keys depend on this

-- Absolute line numbers (LazyVim defaults to `relativenumber = true`).
vim.opt.relativenumber = false

-- LazyVim already sets number, signcolumn and clipboard (unnamedplus), so the
-- rest of the old options.lua is redundant.

-- Use Telescope for LazyVim's built-in finder keys (<leader>ff, <leader>fg, ...)
vim.g.lazyvim_picker = "telescope"

-- LSP semantic tokens re-highlight the buffer with finer-grained groups and make
-- code look bolder/darker right after a server attaches. Disable them so
-- treesitter (gruvbox-material) keeps its colors.
if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.enable then
  vim.lsp.semantic_tokens.enable(false)
end
