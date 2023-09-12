local status_ok, onedark = pcall(require, 'onedark')

if status_ok then
  onedark.setup({
   style = 'deep'
  })
end
