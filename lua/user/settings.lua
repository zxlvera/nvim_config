local api, g, cmd, fn, opt = vim.api, vim.g, vim.cmd, vim.fn, vim.opt
local o, wo, bo = vim.o, vim.wo, vim.bo

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
opt.cmdheight = 0
opt.laststatus = 0
opt.winbar = '%=%m \\ %f'

-- Colorscheme
opt.termguicolors = true

