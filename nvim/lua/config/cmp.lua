local lspkind = require("lspkind")
local cmp = require("cmp")
local cmp_buffer = require("cmp_buffer")
return {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    sources = {
        {
            name = 'luasnip',
            use_show_condition = false,
        },
        {
            name = 'nvim_lsp',
        },
        {
            name = 'nvim_lua',
        },
        {
            name = 'path',
        },
        {
            name = 'buffer',
            option = {
                -- all buffers
                get_bufnrs = function ()
                    local bufs = {}
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        local size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                        if size < 1024 * 1024 then
                            local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
                            if ok then
                                bufs[buf] = true
                            end
                        end
                    end
                    return vim.tbl_keys(bufs)
                end,
            }
        },
    },
    formatting = {
        format = lspkind.cmp_format{
            mode = 'symbol',
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = string.format("[%s]", string.upper(entry.source.name))
                return vim_item
            end
        }
    },
    mapping = {
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<TAB>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        })
    },
    sorting = {
        comparators = {
            function(...) return cmp_buffer:compare_locality(...) end
        }
    },
}
