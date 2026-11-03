-- Core editing keymaps. Plugin-specific keymaps live in lua/plugins/*.lua.

-- Indent / dedent. In visual mode the selection is kept after shifting; in
-- normal mode the current line is shifted (both dot-repeatable).
vim.keymap.set("n", "<Tab>", ">>", { silent = true, desc = "Indent line" })
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true, desc = "Dedent line" })
vim.keymap.set("v", "<Tab>", ">gv", { silent = true, desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<lt>gv", { silent = true, desc = "Dedent selection" })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { silent = true })
vim.keymap.set("i", "<M-d>", "<C-o>dw", { silent = true })
vim.keymap.set("i", "<M-BS>", "<C-w>", { silent = true })
-- Emacs-style forward-word: jump to the end of the current word and keep
-- inserting there. <C-o>e alone would park the cursor *on* the last character.
vim.keymap.set("i", "<M-f>", "<C-o>e<Right>", { silent = true, desc = "Forward to end of word" })

vim.keymap.set("n", "<C-j>", "o<Esc>", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- LazyVim maps <leader>e to the sidebar explorer, which we've disabled.
vim.keymap.del("n", "<leader>e")

-- Neovim 0.12 ships treesitter node-navigation mappings in visual mode; we only
-- want the treesitter keys we set ourselves (none for now).
for _, lhs in ipairs({ "[n", "]n", "[N", "]N" }) do
  pcall(vim.keymap.del, "x", lhs)
end
