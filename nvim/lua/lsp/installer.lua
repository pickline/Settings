local lsp_installer_servers = require "nvim-lsp-installer.servers"
local notify = require "utils.notify"

local M = {}

function M.setup(servers, options)
    for server_name, _ in pairs(servers) do
        local server_available, server = lsp_installer_servers.get_server(server_name)

        if server_available then
            server:on_ready(function()
                local opts = vim.tbl_deep_extend("force", options, server[server.name] or {})
                server:setup(opts)
            end)
            if not server:is_installed() then
                notify.info("Installing " .. server.name)
                server:install()
            end
        else
            notify.error(server)
        end
    end
end

return M
