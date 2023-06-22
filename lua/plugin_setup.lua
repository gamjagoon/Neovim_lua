local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
local cmp = require('cmp')
local autopair = require('nvim-autopairs')
-- If you want insert `(` after select function or method item
-- luasnip
local ls = require('luasnip')
local types = require('luasnip.util.types')
ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { '<- choiceNode', 'Comment' } },
        },
      },
    },
})
require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
})

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
        }
    }
}

cmp.setup({
    snippet = {
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'buffer',
              option = {
                get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end
              }
        },
        {name = 'luasnip'},
    }),
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ls.expand_or_jumpable() then
            ls.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ls.jumpable(-1) then
            ls.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'buffer',
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
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


autopair.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
