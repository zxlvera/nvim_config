local status_ok, devicons = pcall(require, 'nvim-web-devicons')
if status_ok then
  devicons.get_icons()
end
