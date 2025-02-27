local Plugin = { 'lukas-reineke/indent-blankline.nvim' }

Plugin.main = "ibl"
Plugin.event = { 'User FilePost' }

local highlight = {
    "CursorColumn",
    "Whitespace",
}

Plugin.opts = {
  indent = { char = "│", highlight = "IblChar" },
  scope = { char = "│", highlight = "IblScopeChar" },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
}

return Plugin
