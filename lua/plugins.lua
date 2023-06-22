-- pre init
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- colorscheme
    use "olimorris/onedarkpro.nvim"
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {'akinsho/bufferline.nvim', 
            tag = "*", 
            requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-live-grep-args.nvim",
            }
        },
    }
    use {
        "windwp/nvim-autopairs",
    }
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
      config = function()
        require("nvim-tree").setup {}
      end
    }

    -- auto complete
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
end)
