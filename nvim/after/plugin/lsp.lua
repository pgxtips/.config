local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
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

lsp_zero.configure('tsserver', {
  settings = {
    eslint = {
      enable = true,
      lintTask = 'eslint',
    },
  },
})

lsp_zero.configure('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
})

lsp_zero.configure('clangd', {
  settings = {
    clangd = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = false,
})
