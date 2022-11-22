-- leader
vim.g.mapleader                     = ' '
vim.g.maplocalleader                = ' '

--set utf-8
vim.g.encoding                      = 'utf-8'
vim.o.fileencoding                  = 'utf-8'

-- absolute numer
vim.wo.number                       = true
vim.wo.cursorline                   = true

-- 缩进2个空格等于一个tab
vim.o.tabstop                       = 4
vim.bo.tabstop                      = 4
vim.o.softtabstop                   = 4
vim.o.shiftround                    = true

-- << >> 时移动长度
vim.o.shiftwidth                    = 4
vim.bo.shiftwidth                   = 4

-- 新行对齐当前行,空格代替tab
vim.o.expandtab                     = true
vim.bo.expandtab                    = true
vim.o.autoindent                    = true
vim.bo.autoindent                   = true
vim.o.smartindent                   = true

-- 搜索大小写不敏感
vim.o.ignorecase                    = true
vim.o.smartcase                     = true

-- 搜索不要高亮
vim.o.hlsearch                      = false

-- 命令行高调整
vim.o.cmdheight                     = 2

-- 自动读取文件修改
vim.o.autoread                      = true
vim.bo.autoread                     = true

-- 鼠标支持
vim.o.mouse                         = "a"

-- always show tabline
vim.o.showtabline                   = 4

-- 补全增强
-- vim.o.wildmenu                      = true

-- 不可见字符显示
vim.o.list                          = true

-- 禁止创建备份文件
vim.o.backup                        = false
vim.o.writebackup                   = false
vim.o.swapfile                      = false

-- 自动补全不自动选中
-- vim.g.completeopt                   = "menu,menuone,noselect,noinsert"

-- 更小的更新时间
vim.o.updatetime                    = 300

-- 开启代码折叠
vim.wo.foldmethod                   = 'expr'
vim.wo.foldexpr                     = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel                    = 90

-- 显示状态栏,避免lsp导致的编辑区移动
vim.wo.signcolumn                   = "yes"

-- 禁用vim默认status
vim.o.showmode                      = false

vim.cmd[[ colorscheme nord ]]
