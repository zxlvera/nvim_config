local status_ok, lightbulb = pcall(require, 'nvim-lightbulb')
if status_ok then
  return lightbulb.setup({
    autocmd = {
      enabled = true
    }
  })
end
