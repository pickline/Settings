local whichkey = require("which-key")

local keymap_leader = {
    t = {
        name = "Nvim Tree",
        t = { ":NvimTreeToggle<CR>", "toggle nvim tree"},
        f = { ":NvimTreeFocus<CR>", "focus nvim tree"},
    }
}


whichkey.register(keymap_leader, { prefix = "<leader>"})
