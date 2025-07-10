local Plugin = {'mason-org/mason.nvim'}

Plugin.lazy = false

-- See :help mason-settings
Plugin.opts = {
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

return Plugin
