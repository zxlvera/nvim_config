local Plugin = {
  "sainnhe/gruvbox-material"
}

function Plugin.init()
  vim.g.gruvbox_material_background = 'hard'
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_transparent_background = 1
end

return Plugin
