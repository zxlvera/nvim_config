local status_ok, whichkey = pcall(require, 'which-key')
if status_ok then
  return whichkey.setup({
    triggers = {
      "<leader>",
      "g"
    }
  })
end

