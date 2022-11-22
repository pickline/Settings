local whichkey = require("which-key")

local M = {
    t = {
        e = {
            name = "telescope",
            f = {":Telescope find_files<CR>", "find file"},
            b = {":Telescope buffers<CR>", "move to other buffer"},
            l = {":Telescope live_grep<CR>", "live grep"},
            h = {":Telescope help_tags<CR>", "help tags"},
        }
    }
}

whichkey.register(M, { prefix = "<leader>"})
