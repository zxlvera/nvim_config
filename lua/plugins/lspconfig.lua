return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ruff",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })

      local on_attach_pyright = function(client, _)
        -- Disable all capabilities except hoverProvider
        -- client.server_capabilities.completionProvider = false
        -- client.server_capabilities.definitionProvider = false
        -- client.server_capabilities.typeDefinitionProvider = false
        -- client.server_capabilities.implementationProvider = false
        -- client.server_capabilities.referencesProvider = false
        -- client.server_capabilities.documentSymbolProvider = false
        -- client.server_capabilities.workspaceSymbolProvider = false
        -- client.server_capabilities.codeActionProvider = false
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
        -- client.server_capabilities.renameProvider = false
        -- client.server_capabilities.signatureHelpProvider = false
        -- client.server_capabilities.documentHighlightProvider = false
        -- client.server_capabilities.foldingRangeProvider = false
        -- client.server_capabilities.semanticTokensProvider = false
        -- client.server_capabilities.declarationProvider = false
        -- client.server_capabilities.callHierarchyProvider = false
        -- client.server_capabilities.diagnosticProvider = false

        -- Enable hoverProvider
        client.server_capabilities.hoverProvider = true
      end


      -- Configure pyright
      lspconfig.pyright.setup({
        on_attach = on_attach_pyright,
        capabilities = (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return capabilities
        end)(),
        settings = {
          python = {
            analysis = {
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportUnusedVariable = "warning",
              },
              typeCheckingMode = "off", -- Set type-checking mode to off
              diagnosticMode = "off",   -- Disable diagnostics entirely
            },
          },
        },
      })

      local on_attach_ruff = function(client, _)
        if client.name == "ruff" then
          -- disable hover in favor of pyright
          client.server_capabilities.hoverProvider = false
        end
      end

      local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })
      vim.api.nvim_create_autocmd('LspAttach', {
        group = group,
        desc = 'LSP actions',
        callback = function(event)
          local bufmap = function(mode, lhs, rhs, desc)
            local opts = { buffer = event.buf, desc = desc }
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          -- You can search each function in the help page.
          -- For example :help vim.lsp.buf.hover()

          bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover documentation')
          bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show function signature')
          bufmap('n', 'gS', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol')
          bufmap('n', 'gb', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format buffer')
          bufmap('n', 'gC', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Execute code action')
          bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show line diagnostic')
          bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Previous diagnostic')
          bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next diagnostic')
        end
      })


      lspconfig.ruff.setup({
        on_attach = on_attach_ruff,
        init_options = {
          settings = {
            args = {
              "--ignore",
              "F821",
              "--ignore",
              "E402",
              "--ignore",
              "E722",
              "--ignore",
              "E712",
            },
          },
        },
      })
      --
      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = false,
        float = {
          border = 'rounded',
          source = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
          },
        },
      })
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 70,
        height = 15,
      })
      vim.lsp.handlers["textDocument/signatureHelp"] =
          vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end,
  },
}

-- local Plugin = { 'neovim/nvim-lspconfig' }
-- local user = {}
--
-- Plugin.dependencies = {
--   { 'hrsh7th/cmp-nvim-lsp' },
--   { 'williamboman/mason.nvim' },
--   { 'williamboman/mason-lspconfig.nvim' },
-- }
--
-- Plugin.cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' }
--
-- Plugin.event = { 'BufReadPre', 'BufNewFile' }
--
-- function Plugin.init()
--   -- See :help vim.diagnostic.config()
--   vim.diagnostic.config({
--     virtual_text = true,
--     severity_sort = false,
--     float = {
--       border = 'rounded',
--       source = true,
--     },
--     signs = {
--       text = {
--         [vim.diagnostic.severity.ERROR] = '✘',
--         [vim.diagnostic.severity.WARN] = '▲',
--         [vim.diagnostic.severity.HINT] = '⚑',
--         [vim.diagnostic.severity.INFO] = '»',
--       },
--     },
--   })
--
--   vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--     vim.lsp.handlers.hover,
--     { border = 'rounded' }
--   )
--
--   vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--     vim.lsp.handlers.signature_help,
--     { border = 'rounded' }
--   )
-- end
--
-- function Plugin.config()
--   local lspconfig = require('lspconfig')
--   local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--   local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })
--
--   vim.api.nvim_create_autocmd('LspAttach', {
--     group = group,
--     desc = 'LSP actions',
--     callback = user.on_attach
--   })
--
--   -- See :help mason-lspconfig-settings
--   require('mason-lspconfig').setup({
--     handlers = {
--       -- See :help mason-lspconfig-dynamic-server-setup
--       function(server)
--         -- See :help lspconfig-setup
--         lspconfig[server].setup({
--           capabilities = lsp_capabilities,
--         })
--       end,
--       ['lua_ls'] = function()
--         -- if you install the language server for lua it will
--         -- load the config from lua/plugins/lsp/lua_ls.lua
--         require('plugins.lsp.lua_ls')
--       end
--     }
--   })
-- end
--
-- function user.on_attach(event)
--   local bufmap = function(mode, lhs, rhs, desc)
--     local opts = { buffer = event.buf, desc = desc }
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
--
--   -- You can search each function in the help page.
--   -- For example :help vim.lsp.buf.hover()
--
--   bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover documentation')
--   bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition')
--   bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration')
--   bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation')
--   bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Go to type definition')
--   bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Go to reference')
--   bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show function signature')
--   bufmap('n', 'gS', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol')
--   bufmap('n', 'gb', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format buffer')
--   bufmap('n', 'gC', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Execute code action')
--   bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show line diagnostic')
--   bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Previous diagnostic')
--   bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next diagnostic')
-- end
--
-- return Plugin
