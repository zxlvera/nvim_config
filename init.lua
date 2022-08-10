if vim.fn.exists("g:vscode") == 0 then

  local api, g, cmd, fn, opt = vim.api, vim.g, vim.cmd, vim.fn, vim.opt
  local o, wo, bo = vim.o, vim.wo, vim.bo
  local map = require('utils').map
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  end

  g.mapleader = ' '
  g.cursorhold_updatetime = 100
  opt.encoding='utf8'
  opt.mouse = 'a'
  opt.number = true
  -- opt.relativenumber = true
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.softtabstop = 2
  opt.expandtab = true
  opt.completeopt = {'menu', 'menuone', 'noselect'}
  opt.laststatus = 3

  -- Colorscheme
  opt.termguicolors = true

  -- Folders load (termguicolors need to load first)
  -- plugins.lua itself
  require('plugins')
  require('impatient')

  -- folders
  require('plugins.lsp')
  require('config.devicons')
  require('config.lualine')
  require('config.cmp')
  require('config.commented')
  require('config.gitsigns')
  require('config.nvim-tree')
  require('config.null-ls')
  require('config.telescope')
  require('config.trouble')
  require('config.which-key')

  -- Key Mappings
  -- g.gruvbox_material_enable_bold = 1
  -- g.gruvbox_material_enable_italic = 1
  g.nord_italic = 1
  g.nord_italic_comments = 1
  cmd[[colorscheme nord]]
  map('i', 'jk', '<ESC>')
  map("n", "<Leader>h", ":nohlsearch<CR>", { silent = true })
  map("n", "<C-w>", ":w!<CR>")
  map("n", "<C-q>", ":wq!<CR>")
  map("n", "<Leader>w", ":w<CR>")
  map('n', '<c-h>', '<c-w>h')
  map('n', '<c-j>', '<c-w>j')
  map('n', '<c-k>', '<c-w>k')
  map('n', '<c-l>', '<c-w>l')

  -- Nvimtree Keymaps
  map("n", "<Leader>e", ":NvimTreeToggle<CR>")
  map("n", "<Leader>gg", ":LazyGit<CR>")

  -- Telescope Keymaps
  map("n", "<Leader>ff", ":Telescope find_files<CR>")
  map("n", "<Leader>fb", ":Telescope buffers<CR>")
  map("n", "<Leader>fg", ":Telescope live_grep<CR>")
  map("n", "<Leader>fh", ":Telescope help_tags<CR>")

  -- Trouble Keymaps
  map("n", "<leader>xx", "<cmd>Trouble<cr>",
    {silent = true, noremap = true}
  )
  map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
    {silent = true, noremap = true}
  )
  map("n", "<leader>xD", "<cmd>Trouble document_diagnostics<cr>",
    {silent = true, noremap = true}
  )
  map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    {silent = true, noremap = true}
  )
  map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    {silent = true, noremap = true}
  )
  map("n", "gR", "<cmd>Trouble lsp_references<cr>",
    {silent = true, noremap = true}
  )
  map("n", "gi", "<cmd>Trouble lsp_implementations<cr>",
    {silent = true, noremap = true}
  )
  --[[ map("n", "gd", "<cmd>Trouble lsp_definitions<cr>",
    {silent = true, noremap = true}
  )]]-- 
  map("n", "gD", "<cmd>Trouble lsp_type_definitions<cr>",
    {silent = true, noremap = true}
  )
end
