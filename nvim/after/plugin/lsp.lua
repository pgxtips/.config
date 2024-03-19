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
end)

lsp_zero.setup()

vim.diagnostic.config({
  virtual_text = false,
})
