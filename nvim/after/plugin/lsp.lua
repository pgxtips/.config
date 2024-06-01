local lsp_zero = require('lsp-zero')

-- lsp_zero.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {"tsserver", "eslint", "phpactor", "lua_ls", "rust_analyzer", "clangd", "lua_ls"},
    handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end,

    },
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  lsp_zero.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
end)

local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip").filetype_extend("javascript", { "jsdoc" })
require("luasnip").filetype_extend("php", { "phpdoc" })

cmp.setup({
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
    mapping = {
        ['<Space>'] = cmp.mapping.confirm({select = false}),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    },
})


lsp_zero.setup()

vim.diagnostic.config({
  virtual_text = true,
})
