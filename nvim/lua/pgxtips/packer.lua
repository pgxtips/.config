-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    ----------------- PLUGINS -----------------
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use "nvim-lua/plenary.nvim" -- Dependency of telescope && harpoon


    ---------------- TELESCOPE ----------------
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    --------------- KANAGAWA CS ---------------
    use({
        "rebelot/kanagawa.nvim",
        as = "kanagawa",
    })


    ---------------- TREESITTER ----------------
    use('nvim-treesitter/nvim-treesitter', {
        commit = '<9bfaf62e42bdcd042df1230e9188487e62a112c0>',
        run = ':TSUpdate'
    })


    ----------------- HARPOON ------------------
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }


    ----------------- UNDO TREE ----------------
    use("mbbill/undotree")


    ----------------- TROUBLE ------------------
    -- for quickfix lsp support (diagnostics list)
    use("folke/trouble.nvim")

    ----------------- LSP ZERO -----------------
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
            {'saadparwaiz1/cmp_luasnip'}, -- Required
            {'rafamadriz/friendly-snippets'}, -- Required,
        }
    }

    --------------- GITHUB COPILOT --------------
    use("github/copilot.vim")


    ------------- GITHUB INTEGRATION ------------
    use("tpope/vim-fugitive");


    ---------------- VIM DEBUGGER ---------------
    use "mfussenegger/nvim-dap"
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"nvim-neotest/nvim-nio"}
    }
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"


    ------------- VIM PRACTICE GAME -------------
    use("ThePrimeagen/vim-be-good");

end)


