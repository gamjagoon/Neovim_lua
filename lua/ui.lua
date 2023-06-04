vim.cmd("colorscheme onedark")
vim.opt.termguicolors = true
require("bufferline").setup{}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
