local whichkey = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal

local common_opts = {
    hiddent = true,
    direction = 'float',
    env = {
        https_proxy = "http://127.0.0.1:7890",
        http_proxy = "http://127.0.0.1:7890",
        all_proxy = "socks5://127.0.0.1:7890",
    },
}

function _toggle_with_cmd(cmd)
    local terminal = Terminal:new(table.merge({cmd = cmd}, common_opts))
    terminal:toggle()
end

local M = {
    t = {
        s = {"<cmd>lua _toggle_with_cmd()<CR>", "open terminal"},
        g = {"<cmd>lua _toggle_with_cmd(\"lazygit\")<CR>", "open lazygit terminal"},
        h = {"<cmd>lua _toggle_with_cmd(\"htop\")<CR>", "open htop terminal"},
    }
}

whichkey.register(M, { prefix = "<leader>" })
