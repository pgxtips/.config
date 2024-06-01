require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "vim", "vimdoc", "query", "javascript", "jsdoc", "typescript", "php", "phpdoc","html",  "c", "lua", "rust", "vue", "dockerfile" },
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "vue" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
