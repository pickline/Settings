local whichkey = require("which-key")


local M = {
    b = {
        name = "bufferline",
        l = {":BufferLineCycleNext<CR>", "move to next buffer"},
        h = {":BufferLineCyclePrev<CR>", "move to previous buffer"},
        q = {":BufferLinePickClose<CR>", "close buffer"},
        t = {":BufferLinePick<CR>", "pick buffer"},
    }
}

whichkey.register(M, { prefix = "<leader>"})
