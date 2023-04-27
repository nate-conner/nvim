-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

--    use({
--        'olimorris/onedarkpro.nvim',
--       config = function()
--            vim.cmd('colorscheme onedark')
--       end
--   })
    use 'olimorris/onedarkpro.nvim'
    use 'AlessandroYorba/Alduin'

    use 'gruvbox-community/gruvbox'
    use 'sainnhe/gruvbox-material'
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    -- comment use with gcc
    use 'terrortylor/nvim-comment'
    require('nvim_comment').setup()

    use 'ThePrimeagen/harpoon'

    -- use {'iamcco/markdown-preview.nvim'}
    use({ "iamcco/markdown-preview.nvim", 
     run = "cd app && npm install", 
     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
     ft = { "markdown" }, })
    -- install without yarn or npm
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })
    
    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                {
                    window = {
                        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                        -- height and width can be:
                        -- * an absolute number of cells when > 1
                        -- * a percentage of the width / height of the editor when <= 1
                        -- * a function that returns the width or the height
                        width = 200, -- width of the Zen window
                        height = 1, -- height of the Zen window
                        -- by default, no options are changed for the Zen window
                        -- uncomment any of the options below, or add other vim.wo options you want to apply
                        options = {
                            -- signcolumn = "no", -- disable signcolumn
                            -- number = false, -- disable number column
                            -- relativenumber = false, -- disable relative numbers
                            -- cursorline = false, -- disable cursorline
                            -- cursorcolumn = false, -- disable cursor column
                            -- foldcolumn = "0", -- disable fold column
                            -- list = false, -- disable whitespace characters
                        },
                    },
                    plugins = {
                    },
                    -- callback where you can add custom code when the Zen window opens
                    on_open = function(win)
                    end,
                    -- callback where you can add custom code when the Zen window closes
                    on_close = function()
                    end,
                }
            }
        end
    }

    use 'preservim/nerdtree'

    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use {
        "mxsdev/nvim-dap-vscode-js",
    }
end)

