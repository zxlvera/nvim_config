if vim.fn.exists("g:vscode") == 0 then

  local g, cmd, fn, opt = vim.g, vim.cmd, vim.fn, vim.opt
  local o, wo, bo = vim.o, vim.wo, vim.bo
  local map = require('utils').map
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  end

  g.mapleader = ' '
  g.cursorhold_updatetime = 100
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
  require('config.lualine')
  require('config.cmp')
  require('config.commented')
  require('config.gitsigns')
  require('config.git-worktree')
  require('config.neo-tree')
  require('config.null-ls')
  require('config.telescope')
  require('config.trouble')
  require('config.which-key')

  -- Key Mappings
  cmd[[colorscheme gruvbox-material]]
  map('i', 'jk', '<ESC>')
  map("n", "<Leader>h", ":nohlsearch<CR>", { silent = true })
  map("n", "<C-q>", ":q<CR>")
  map("n", "<Leader>w", ":w<CR>")
  map('n', '<S-h>', ':bprevious<CR>')
  map('n', '<S-l>', ':bnext<CR>')
  map('n', '<c-h>', '<c-w>h')
  map('n', '<c-j>', '<c-w>j')
  map('n', '<c-k>', '<c-w>k')
  map('n', '<c-l>', '<c-w>l')

  map('n', '<Leader>g', ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
  map("n", "<Leader>e", ":NeoTreeFloatToggle<CR>")
  map("n", "<Leader>fb", ":Neotree float buffers<CR>")
  map("n", "<Leader>ff", ":Telescope find_files<CR>")
  map("n", "<Leader>fg", ":Neotree float git_status<CR>")
end
