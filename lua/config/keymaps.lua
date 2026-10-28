vim.keymap.set('v', '<Tab>', '>gv', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', '<lt>gv', { silent = true })
vim.keymap.set('i', '<S-Tab>', '<C-d>', { silent = true })
vim.keymap.set('i', '<M-d>', '<C-o>dw', { silent = true })
vim.keymap.set('i', '<M-BS>', '<C-w>', { silent = true })

vim.keymap.set('n', '<C-j>', 'o<Esc>', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })

vim.keymap.set('x', '<C-d>d', function()
  require('visual-multi').from_visual(true)
end, { desc = 'Visual Multi: select all' })

vim.keymap.set({ 'n', 'v' }, '<leader>-', '<cmd>Yazi<cr>', { desc = 'Open yazi at the current file' })
vim.keymap.set('n', '<leader>cw', '<cmd>Yazi cwd<cr>', { desc = 'Open yazi in nvim working directory' })

vim.keymap.set('n', '<leader>fnc', function()
  require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Find Neovim config files' })
vim.keymap.set('n', '<leader>fl', function()
  require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Find Neovim config files' })
