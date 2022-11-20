return {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = 'single' })
        end
    },
    profile = {
        enable = true,
        threshold = 1
    }
}
