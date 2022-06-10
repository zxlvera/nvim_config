if vim.fn.exists("g:vscode") == 0 then

  local g, cmd, opt = vim.g, vim.cmd, vim.opt
  local o, wo, bo = vim.o, vim.wo, vim.bo
  local map = require('utils').map

  g.mapleader = ' '
  opt.number = true
  opt.relativenumber = true
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.softtabstop = 2
  opt.expandtab = true
  opt.completeopt = "menu,menuone,noselect"

  -- Colorscheme
  opt.termguicolors = true
  cmd[[colorscheme nord]]

  -- Folders load (termguicolors need to load first)
  -- plugins.lua itself
  require('plugins')
  -- folders
  require('plugins.lsp')
  require('config.feline')
  require('config.cmp')
  require('config.commented')
  require('config.gitsigns')
  require('config.neo-tree')
  require('config.null-ls')

  -- Key Mappings
  map("n", "<Leader>h", ":nohlsearch<CR>", { silent = true })
  map("n", "<Leader>w", ":w<CR>")
  map('n', '<c-h>', '<c-w>h')
  map('n', '<c-j>', '<c-w>j')
  map('n', '<c-k>', '<c-w>k')
  map('n', '<c-l>', '<c-w>l')

  map("n", "<Leader>e", ":NeoTreeFloatToggle<CR>")
  map("n", "<Leader>g", ":Neotree float git_status<CR>")
  map("n", "<Leader>b", ":Neotree float buffers<CR>")
  map("n", "<Leader>ff", ":Telescope find_files<CR>")

  -- nvim-cmp supports additional completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  -- Enable the following language servers
  local lspconfig = require 'lspconfig'
  local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

end
