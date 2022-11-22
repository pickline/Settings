local lspkind = require("lspkind")
local cmp = require("cmp")
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
    }
}
