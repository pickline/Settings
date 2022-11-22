local whichkey = require("which-key")

local keymap_leader = {
    p = {
        name = "packer",
        s = { ":PackerSync<CR>", "sync packer plugins"},
        c = { ":PackerCompile<CR>", "compile packer"},
        S = { ":PackerStatus<CR>", "show status of packer"},
    }
}


whichkey.register(keymap_leader, { prefix = "<leader>"})
