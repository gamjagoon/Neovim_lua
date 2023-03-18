-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better splites
keymap("n", "sp", ":split<cr>", opts)
keymap("n", "vs", ":vsplit<cr>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "cb", ":bprevious<CR>:bdelete #<CR>", opts)
keymap("n", "<leader>it", ":e ~/.config/nvim/init.lua<CR>", opts)

keymap("n", "<space>;", "$A;<ESC>", opts)

-- Clear highlights
keymap("n", "<space>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Telescope
keymap("n", "<space>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<space>fr", ":Telescope live_grep<CR>", opts)
keymap("n", "<space>fp", ":Telescope projects<CR>", opts)
keymap("n", "<space>fb", ":Telescope buffers<CR>", opts)

-- NvimTree
keymap("n", "<Space>e", ":NvimTreeToggle<CR>", opts)

-- Custom --

-- Search
keymap("v", "<leader>f", "y/<C-R>\"<CR>", opts)
keymap("v", "<leader>rs", "y:!rg \"<C-R>\"\" . > ~/.config/nvim/rg.log<CR>", opts)
keymap("n", "<leader>rs", ":!rg \"<C-R><C-W>\" . > ~/.config/nvim/rg.log<CR>", opts)
keymap("n", "<leader>rl", ":e ~/.config/nvim/rg.log<CR>", opts)
