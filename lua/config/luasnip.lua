local status_ok, luasnip = pcall(require, 'luasnip.loaders.from_vscode')
if status_ok then
  return luasnip.lazy_load()
end
