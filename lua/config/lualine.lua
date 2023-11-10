local status_ok, lualine = pcall(require, 'lualine')
if status_ok then
  return lualine.setup({
        options = {
        theme = "everforest"
    }
  })
end

