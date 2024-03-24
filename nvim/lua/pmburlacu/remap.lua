vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Select All
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {noremap = true})
-- Copy
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', {noremap = true})
-- Paste
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {noremap = true})

-- Copy (in visual mode)
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true})
-- Paste (in visual mode)
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', {noremap = true})

-- Undo
vim.api.nvim_set_keymap('n', '<C-z>', ':undo<CR>', {noremap = true})
-- Redo
vim.api.nvim_set_keymap('n', '<C-y>', ':redo<CR>', {noremap = true})
