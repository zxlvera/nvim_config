local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
  null_ls.setup({
    debug = true,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                  vim.lsp.buf.formatting_seq_sync()
              end,
          })
      end
  end,
    sources = {
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
      null_ls.builtins.formatting.eslint_d,
      -- null_ls.builtins.formatting.prettier,
    }
  })
end
