local whichkey = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float'})
local htop = Terminal:new({ cmd = "htop", hidden = true, direction = 'float'})

function _lazygit_toggle()
    lazygit:toggle()
end

function _htop_toggle()
    htop:toggle()
end

local M = {
    t = {
        s = {":ToggleTerm<CR>", "open terminal"},
        g = {"<cmd>lua _lazygit_toggle()<CR>", "open lazygit terminal"},
        h = {"<cmd>lua _htop_toggle()<CR>", "open htop terminal"},
    }
}

whichkey.register(M, { prefix = "<leader>" })
