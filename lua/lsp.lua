local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local rt = require("rust-tools")
local lspconfig = require("lspconfig")
-- after the language server attaches to the current buffer

local rt_opts = {
  -- rust-tools options
    tools = {
      executor = require('rust-tools/executors').termopen,
      on_initialized = nil,
      reload_workspace_from_cargo_toml = true,
      hover_with_actions = true,
      inlay_hints = {
        auto = true,
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = 'Comment',
      },
      hover_actions = {
        border = {
          { '╭', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╮', 'FloatBorder' },
          { '│', 'FloatBorder' },
          { '╯', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╰', 'FloatBorder' },
          { '│', 'FloatBorder' },
        },
        auto_focus = false,
      },
      crate_graph = {
        backend = 'x11',
        output = nil,
        full = true,
    },
    },
    server = {
        on_attach = on_attach,
        standalone = true,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              enable = false,
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
            },
          },
        },
    },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, noremap=true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})

mason.setup()
mason_lspconfig.setup{
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright"},
}
-- Setup language servers.
lspconfig['rust_analyzer'].setup {
}
rt.setup(rt_opts)
