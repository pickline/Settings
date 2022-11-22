local whichkey = require("which-key")

local M = {
    b = {
        name = "bufferline",
        l = {":BufferLineCycleNext<CR>", "move to next buffer"},
        h = {":BufferLineCyclePrev<CR>", "move to previous buffer"},
    }
}

whichkey.register(M, { prefix = "<leader>"})
