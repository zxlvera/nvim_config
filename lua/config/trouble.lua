local status_ok, trouble = pcall(require, 'trouble')
if status_ok then
  return trouble.setup({})
end
