-- local configs = require("nvim-treesitter.configs")
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "javascript", "html", "css" },
  auto_install = true,
  sync_install = false,
  ignore_install = { "rust" },
  highlight = {
    enable = true,
    disable = { "c" },
    additional_vim_regex_lighlighting = true
  }
}
