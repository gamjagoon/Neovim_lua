require('keymaps') -- ~/.config/nvim/lua/keymaps.lua
require('plugins') -- ~/.config/nvim/lua/plugins.lua

-- =============== --
-- EDITOR SETTINGS --
-- =============== --

vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 20             -- 위아래 간격 맞춰줌 
vim.o.mouse = "a"
vim.o.mousefocus = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.breakindent = true
vim.o.tabstop = 2 
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.swapfile = false
vim.o.updatetime=300

vim.o.number = true
vim.o.relativenumber = true      -- 상대 숫자 표시해줌 

-- ============ --
-- ERR REPORTER --
-- ============ --
vim.notify = function (msg, log_level, _opts)
	if msg:match("exit code") then return end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
	vim.api.nvim_echo({{msg}}, true, {})
	end
end

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd('colorscheme tokyonight-storm')

require("mason").setup()

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = false,
  auto_install = false,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

-- File Explorer nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

--Pretty Status bar
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
	},
}

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Add Ctrl + X and initialize toggle term 
require("toggleterm").setup {
	open_mapping = [[<leader>t]],
	shade_terminals = true
}

-- Smarter Indent setup
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:$"

require("indent_blankline").setup {
    space_char_blankline = ".",
    show_current_context = true,
    show_current_context_start = true,
}
local cmp = require'cmp'

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
    }, 
    {
      { name = 'buffer' },
    }
  )
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Set up lspconfig.
require("mason-lspconfig").setup({
	ensure_installed = {
    'bashls',
    'gopls',
    'sumneko_lua',
		'pylsp',
		'rust_analyzer',
  },
	automatic_installation = true,
})

require'lspconfig'.bashls.setup{}
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.rust_analyzer.setup{}


-- highlight
vim.api.nvim_set_hl(0, "LineNr", {ctermfg=168})
vim.api.nvim_set_hl(0, "CursorLineNr", {ctermfg=White})
