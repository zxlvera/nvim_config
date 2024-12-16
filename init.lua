if vim.fn.exists("g:vscode") == 0 then

local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

  load('user.settings')
  load('user.keymaps')
  require('user.plugins')

  pcall(vim.cmd.colorscheme, 'gruvbox-material')

end
