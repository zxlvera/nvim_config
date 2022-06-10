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

-- local lsphandlers_status_ok, lsphandler = pcall(require, "plugins.lsp.lsp-handlers")

local on_attach = require('plugins.lsp.lsp-handlers').on_attach
local capabilities = require("plugins.lsp.lsp-handlers").capabilities

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
