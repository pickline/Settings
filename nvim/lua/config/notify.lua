local nvim_notify = require "notify"

nvim_notify.setup {
    stages = "fade_in_slide_out",
    timeout = 1500,
}

vim.notify = nvim_notify
