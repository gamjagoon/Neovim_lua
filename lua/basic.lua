local vopt = vim.opt
local vmap = vim.keymap
local silent_opt = {noremap=true, silent = true}

-- View Setting
vopt.mouse  = 'a'
vopt.nu = true
vopt.rnu = true
vopt.ignorecase = true
vopt.smartcase  = true
vopt.hlsearch = true
vopt.wrap = false
vopt.tabstop = 4
vopt.shiftwidth = 4
vopt.expandtab = true
vopt.listchars = {space='·', tab = '>-', eol = '$'}
vopt.list = true
vopt.clipboard = "unnamedplus"
vopt.tags = {"./tags"}



-- Key Binding
vmap.set('n', 'cb', '<cmd>bn<bar>bd#<cr><cmd>bp<cr>', silent_opt)

vmap.set('n', '<c-h>','<c-w>h',silent_opt)
vmap.set('n', '<c-j>','<c-w>j',silent_opt)
vmap.set('n', '<c-k>','<c-w>k',silent_opt)
vmap.set('n', '<c-l>','<c-w>l',silent_opt)
vmap.set('n', 'sp','<cmd>split<cr>',silent_opt)
vmap.set('n', 'vs','<cmd>vsplit<cr>',silent_opt)

vmap.set('n', '<s-h>','<cmd>bp<cr>',silent_opt)
vmap.set('n', '<s-l>','<cmd>bn<cr>',silent_opt)

vmap.set({'n', 'v'}, '<leader><space>', '<cmd>nohl<cr>', silent_opt)

vmap.set({'n', 'v'}, 'p', '"+p', silent_opt)
vmap.set({'n', 'v'}, 'y', '"+y', silent_opt)
vmap.set({'n', 'v'}, 'P', '"+P', silent_opt)
vmap.set({'n', 'v'}, 'Y', '"+Y', silent_opt)

-- init lua
vmap.set('n', '<leader>it','<cmd>e ~/.config/nvim/init.lua<cr>',silent_opt)

-- rust-tools
--vmap.set('n', '<space>ha', '<cmd>RustHoverActions<cr>', silent_opt)
--vmap.set('n', '<space>ca', '<cmd>RustCodeAction<cr>', silent_opt)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>/', builtin.current_buffer_fuzzy_find, {})

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<space>rg", live_grep_args_shortcuts.grep_word_under_cursor)
vim.keymap.set("v", "<space>rg", live_grep_args_shortcuts.grep_word_under_cursor)

-- nvim tree
vim.keymap.set('n', '<space>e', '<cmd>NvimTreeToggle<cr>', {})

vim.api.nvim_create_autocmd( 
    {
        "BufEnter",
    },
    {
        pattern = "*.S,*.asm,*.s",
        command = "set syntax=c"
    }
)

-- BUffline
vim.keymap.set('n', '<space>1', '<cmd>BufferLineGoToBuffer 1<cr>', {})
vim.keymap.set('n', '<space>2', '<cmd>BufferLineGoToBuffer 2<cr>', {})
vim.keymap.set('n', '<space>3', '<cmd>BufferLineGoToBuffer 3<cr>', {})
vim.keymap.set('n', '<space>4', '<cmd>BufferLineGoToBuffer 4<cr>', {})
vim.keymap.set('n', '<space>5', '<cmd>BufferLineGoToBuffer 5<cr>', {})
vim.keymap.set('n', '<space>6', '<cmd>BufferLineGoToBuffer 6<cr>', {})
vim.keymap.set('n', '<space>7', '<cmd>BufferLineGoToBuffer 7<cr>', {})
vim.keymap.set('n', '<space>8', '<cmd>BufferLineGoToBuffer 8<cr>', {})
vim.keymap.set('n', '<space>9', '<cmd>BufferLineGoToBuffer 9<cr>', {})

-- highlight
vim.cmd([[set cursorline]])
vim.cmd([[hi LineNr ctermfg=Red]])

if vim.g.neovide then
    -- vim.o.guifont = "FiraCode Nerd Font:20"
    if vim.loop.os_uname().sysname == "Darwin" then
        vim.o.guifont = "Hack Nerd Font:h16"
    else
        vim.o.guifont = "Hack Nerd Font:h18"
    end
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_fullscreen = false
    vim.g.neovide_remember_window_size = true
end
