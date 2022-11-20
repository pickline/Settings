local M = {}

local servers = {
    clangd = {},
    dockerls = {},
    -- gopls = {},
    jsonls = {},
    sumneko_lua = {},
    remark_ls = {},
    pylsp = {},
    -- taplo = {},
    yamlls = {},
}

local function on_attach(client, bufnr)
    -- Enable completion triggerd by <C-x><C-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Use LSP as the handler for formatexpr
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    require("lsp.keymaps").setup(client, bufnr)

    require("lsp.highlighting").setup(client, bufnr)

    require("lsp.autocmd").setup(client, bufnr)
end



local opts = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}

require("lsp.handlers").setup()

function M.setup()
    require("lsp.installer").setup(servers, opts)
end

return M
