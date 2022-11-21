local highlights = require("nord").bufferline.highlights({
    italic = true,
    bold = true,
})
return {
    options = {
        separator_style = "slant",
    },
    highlights = highlights,
}
