local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      'tsserver',
      'eslint',
      'phpactor',
      'lua_ls',
      'rust_analyzer',
      'clangd',
  },

  handlers = {
    lsp_zero.default_setup,
  },

})

vim.diagnostic.config({
  virtual_text = false,
})
