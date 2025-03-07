return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    -- your options... For example:
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    show_guides = true,
  },
  keys = {
    { "<leader>ta", "<cmd>:Telescope aerial<cr>", desc = "Aerial: Toggle" },
    -- etc.
  },
}
