local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local rt = require("rust-tools")
local lspconfig = require("lspconfig")
local lsp_capabilites = require("cmp_nvim_lsp").default_capabilities()
-- after the language server attaches to the current buffer


local rt_opts = {
  -- rust-tools options
    tools = {
      executor = require('rust-tools/executors').termopen,
      on_initialized = nil,
      reload_workspace_from_cargo_toml = true,
      hover_with_actions = false,
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
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = function (_, bufnr)
          vim.keymap.set("n", "<space>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<space>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        standalone = true,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              comment = "clippy",
            },
            diagnostics = {
                enable = true,
                enableExperimental = true,
            },
            capabilites = lsp_capabilites,
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
-- Setup language servers.

-- python
--[[
lspconfig['pyright'].setup {
    capabilites = lsp_capabilites
}
]]--

lspconfig['lua_ls'].setup {
    capabilites = lsp_capabilites
}


rt.setup(rt_opts)

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = 'E'})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = 'H'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
