local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Completion kinds
local servers = {
	"tsserver",
	"pyright",
	"sumneko_lua",
	"eslint",
	"bashls",
	"yamlls",
	"jsonls",
	"cssls",
	"html",
	"graphql",
	"tailwindcss",
}

lsp_installer.setup({
	ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local lsphandlers_status_ok, lsphandler = pcall(require, "plugins.lsp.lsp-handlers")

local on_attach = require('plugins.lsp.lsp-handlers').on_attach

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
