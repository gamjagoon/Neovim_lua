
require("onedarkpro").setup({
  highlights = {
    LineNr = { fg = "#E68590"}
  }
})

vim.cmd("colorscheme onedark")
vim.opt.termguicolors = true

local bufferline = require('bufferline')
bufferline.setup {
    options = {
        numbers = "ordinal",
        buffer_close_icon = 'x',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        color_icons = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current',
    }
}

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
