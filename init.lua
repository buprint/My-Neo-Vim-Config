require "user.options"
require "user.plugins"
--require "user.colorscheme"
require "user.cmp"
require "user.lsp"
--require "user.telescope"
require "user.treesitter"
--require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
--require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
--require "user.project"
require "user.impatient"
require "user.indent"
--require "user.alpha"
--require "user.whichkey"
require "user.autocommands"
require "user.keybinds"
--[[ require "user.onedarkpro" ]]


vim.o.t_Co="256"
vim.cmd [[
  colorscheme onedarkpro
]]
