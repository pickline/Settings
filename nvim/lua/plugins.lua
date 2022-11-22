local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local packer_config = require("config.packer")

require("packer").startup({function(use)
    use 'wbthomason/packer.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'nvim-lua/plenary.nvim'
    use {
        'Pocco81/auto-save.nvim',
        config = function()
            local config = require("config.auto-save")
            require('auto-save').setup(config)
        end
    }

    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    }

    use {
        'neovim/nvim-lspconfig',
        opt = true,
        event = 'BufReadPre',
        wants = { "nvim-lsp-installer", "vim-illuminate"},
        config = function()
            require("lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
            "RRethy/vim-illuminate"
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function ()
            local ts_update = require("nvim-treesitter.install").update({with_sync = true})
            ts_update()
        end,
        config = function()
            local config = require("config.nvim-treesitter")
            require("nvim-treesitter.configs").setup(config)
        end,
        event = 'VimEnter',
    }


    use "glepnir/dashboard-nvim"

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly',
        config = function()
            require("nvim-tree").setup()
        end
    }

    use {
        'folke/which-key.nvim',
        config = function()
            local config = require "config.which-key"
            require("which-key").setup(config)
        end
    }

    use {
        'rcarriga/nvim-notify',
        event = "BufEnter",
        config = function()
            vim.defer_fn(function()
                require "config.notify"
            end, 2000)
        end
    }

    use 'shaunsingh/nord.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function ()
            local config = require("config.lualine")
            require("lualine").setup(config)
        end

    }

    use {
        'akinsho/bufferline.nvim',
        tag = 'v3.*',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            local config = require("config.bufferline")
            require("bufferline").setup(config)
        end
    }

    use {
        'akinsho/toggleterm.nvim',
        config = function()
            local config = require "config.toggleterm"
            require("toggleterm").setup(config)
        end
    }

    if packer_bootstrap then
        require ('packer').sync()
    end
end, config = packer_config})
