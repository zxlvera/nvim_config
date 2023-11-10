local status_ok, navigator = pcall(require, 'navigator')
if status_ok then
  return navigator.setup({
    debug = false,
    width = 0.75,
    height = 0.3,
    preview_height = 0.35,
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    ts_fold = false,
    default_mapping = false,
    treesitter_analysis = true,
    transparency = 50,
    --on_attach = handlers.on_attach,
    icons = { icons = false },
    lsp = {
      enable = true,
      code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
      code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
      document_highlight = true,
      format_on_save = true,
      diagnostic = {
        underline = true,
        virtual_text = false,
        update_in_insert = false,
        severity_sort = { reverse = true },
      },
      hover = {
        enable = true,
        keymap = {
          ['<C-k>'] = {
            go = function()
              local w = vim.fn.expand('<cWORD>')
              vim.cmd('GoDoc ' .. w)
            end,
            default = function()
              local w = vim.fn.expand('<cWORD>')
              vim.lsp.buf.workspace_symbol(w)
            end,
          },
      },
    },
        diagnostic_scrollbar_sign = {'▃', '▆', '█'}, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
                                                 --                for other style, set to {'╍', 'ﮆ'} or {'-', '='}
    diagnostic_virtual_text = true,  -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
    display_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you want to ignore it
                                  -- set to 'trouble' to show diagnositcs in Trouble
    tsserver = {
      filetypes = {'typescript'} -- disable javascript etc,
      -- set to {} to disable the lspclient for all filetypes
    },

      disable_format_cap = { "stylua" },
      diagnostic_virtual_text = false,
      diagnostic_update_in_insert = false,
      disply_diagnostic_qf = true,
      servers = {
        "tsserver",
      },
    },
  })
end
