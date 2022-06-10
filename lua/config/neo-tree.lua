local status_ok, neotree = pcall(require, 'neo-tree')
if status_ok then
  return neotree.setup({
    window = {
      position = "float",
    }
  })
end


