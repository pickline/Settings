local highlights = require("nord").bufferline.highlights({
    italic = true,
    bold = true,
})
return {
    options = {
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                separator = true,
                style = "slant",
            },
            diagnostics = "nvim_lsp",
        }
    },
    highlights = highlights,
}
