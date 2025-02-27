-- Space as leader key
vim.g.mapleader = ' '

-- Trouble Keymaps
-- map("n", "<leader>xx", "<cmd>Trouble<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xD", "<cmd>Trouble document_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "gR", "<cmd>Trouble lsp_references<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "gi", "<cmd>Trouble lsp_implementations<cr>",
--   {silent = true, noremap = true}
-- )
--  map("n", "gd", "<cmd>Trouble lsp_definitions<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "gD", "<cmd>Trouble lsp_type_definitions<cr>",
--   {silent = true, noremap = true}
-- )

-- Shortcuts
vim.keymap.set({ 'i' }, 'jk', '<ESC>', { desc = 'Shortcut to Insert mode' })
vim.keymap.set({ 'n' }, '<Leader>h', ':nohlsearch<CR>', { desc = 'Toggle highlight' })

-- Basic clipboard interaction
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set({ 'n', 'x' }, 'gp', '"+p', { desc = 'Paste clipboard content' })

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save buffer' })
