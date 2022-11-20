return {
    enable = true,
    execution_message = {
        message = function()
            return ("save at ".. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
    },
    trigger_events = { "InsertLeave", "TextChanged" },
    condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if  fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true
        end
        return false
    end,
    write_all_buffers = false,
    debounce_delay = 135,
    callbacks = { -- functions to be executed at different intervals
        enabling = nil, -- ran when enabling auto-save
        disabling = nil, -- ran when disabling auto-save
        before_asserting_save = nil, -- ran before checking `condition`
        before_saving = nil, -- ran before doing the actual save
        after_saving = nil -- ran after doing the actual save
    }
}