local whichkey = require("which-key")
local fs = require("utils.fs")

local keymap = {}

for name, type in fs.scandir('keymaps') do
    if name ~= 'init.lua' and name ~= 'init.lua.bak' then
        keymap = table.merge(keymap, require(string.format('keymaps.%s', string.sub(name, 0, -5))))
    end
end

whichkey.register(keymap, { prefix = "<leader>"})
