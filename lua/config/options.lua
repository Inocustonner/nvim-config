vim.g.mapleader = " "
vim.g.maplocalleader = "," -- idris2 <localleader> keys depend on this

-- Absolute line numbers (LazyVim defaults to `relativenumber = true`).
vim.opt.relativenumber = false

-- Horizontal panning on long lines (code filetypes run with `wrap` off).
-- LazyVim sets `sidescrolloff = 8`, so the window starts scrolling right while
-- the cursor still has 8 columns of room ("too early"), and the default
-- `sidescroll = 0` then re-centres the cursor -- a half-screen jump. Only pan
-- at the actual edge, and one column at a time so it does not jump.
vim.opt.sidescrolloff = 0
vim.opt.sidescroll = 1

-- No smooth scrolling: `zz`, `<C-d>`/`<C-u>` and mouse/wrapped-line scrolling
-- jump instantly. (LazyVim enables this; the animated scroll itself is
-- `snacks.scroll`, disabled in lua/plugins/snacks.lua.)
vim.opt.smoothscroll = false

-- LazyVim already sets number, signcolumn and clipboard (unnamedplus), so the
-- rest of the old options.lua is redundant.

-- Use Telescope for LazyVim's built-in finder keys (<leader>ff, <leader>fg, ...)
vim.g.lazyvim_picker = "telescope"
