local Plugin = {'folke/which-key.nvim'}

Plugin.event = 'VeryLazy'

Plugin.opts = {
    triggers = {
      "<leader>",
      "g"
    }
  }

  return Plugin

