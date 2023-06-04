local vopt = vim.opt
local vmap = vim.keymap
local silent_opt = {silent = true}

-- View Setting
vopt.nu = true
vopt.rnu = true
vopt.mouse  = 'a'
vopt.ignorecase = true
vopt.smartcase  = true
vopt.hlsearch = true
vopt.wrap = false
vopt.tabstop = 4
vopt.shiftwidth = 4
vopt.expandtab = true
vopt.listchars = {space='.', tab = '>-', eol = '$'}
vopt.list = true
vopt.clipboard = "unnamedplus"

-- Key Binding
vmap.set('n', '<c-h>','<c-w>h',silent_opt)
vmap.set('n', '<c-j>','<c-w>j',silent_opt)
vmap.set('n', '<c-k>','<c-w>k',silent_opt)
vmap.set('n', '<c-l>','<c-w>l',silent_opt)
vmap.set('n', 'sp','<cmd>split<cr>',silent_opt)
vmap.set('n', 'vs','<cmd>vsplit<cr>',silent_opt)

vmap.set('n', '<s-h>','<cmd>bp<cr>',silent_opt)
vmap.set('n', '<s-l>','<cmd>bn<cr>',silent_opt)

vmap.set({'n', 'v'}, 'p', '"+p', silent_opt)
vmap.set({'n', 'v'}, 'y', '"+y', silent_opt)
vmap.set({'n', 'v'}, 'P', '"+P', silent_opt)
vmap.set({'n', 'v'}, 'Y', '"+Y', silent_opt)

-- init lua
vmap.set('n', '<leader>it','<cmd>e ~/.config/nvim/init.lua<cr>',silent_opt)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})

-- nvim tree
vim.keymap.set('n', '<space>e', '<cmd>NvimTreeToggle<cr>', {})
