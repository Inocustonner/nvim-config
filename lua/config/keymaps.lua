-- Core editing keymaps. Plugin-specific keymaps live in lua/plugins/*.lua.

vim.keymap.set("v", "<Tab>", ">gv", { silent = true })
vim.keymap.set({ "n", "v" }, "<S-Tab>", "<lt>gv", { silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { silent = true })
vim.keymap.set("i", "<M-d>", "<C-o>dw", { silent = true })
vim.keymap.set("i", "<M-BS>", "<C-w>", { silent = true })

vim.keymap.set("n", "<C-j>", "o<Esc>", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- LazyVim maps <leader>e to the sidebar explorer, which we've disabled.
vim.keymap.del("n", "<leader>e")
