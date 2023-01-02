local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Have PACKER Manage Itself
  -- Debugger
  use 'mfussenegger/nvim-dap'

  use "windwp/nvim-ts-autotag" -- Auto Tags Closer
  use 'norcalli/nvim-colorizer.lua' -- Color viewer
  use "nvim-lua/popup.nvim" -- Popup API for Neovim 
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "numToStr/Comment.nvim" -- Commenting 
	use "JoosepAlviste/nvim-ts-context-commentstring" -- Better Commenting for Javascript and Typescript 
	use "ahmedkhalf/project.nvim" -- PopUp API
	use "lewis6991/impatient.nvim" -- Makes VIM Bootup Faster
	use "lukas-reineke/indent-blankline.nvim" -- Auto Indent

	use { -- StartUp Page
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    -- config = function ()
    --     require'alpha'.setup(require'alpha.themes.startify'.config)
    -- end
  }
	use "folke/which-key.nvim" -- Keybind Display
	use "kyazdani42/nvim-web-devicons" -- Widely Used Icons

  -- Icon plugins used for most of the plugins

  -- File Explorer
	use "kyazdani42/nvim-tree.lua"

  -- Tabs
	use "akinsho/bufferline.nvim"
	use "moll/vim-bbye"

  -- Terminal
	use "akinsho/toggleterm.nvim"

	-- Colorschemes and Visuals
	use "olimorris/onedarkpro.nvim" -- My Default/Favorate Colorscheme (One Dark Pro)
	use "folke/tokyonight.nvim" -- Tokyo Night
	use "lunarvim/darkplus.nvim" -- VSCode Default Colorscheme 
	use "nvim-lualine/lualine.nvim" -- Vim Status Bar
  use "onsails/lspkind.nvim" -- Icons For Autcompletion

	-- CMP and Autocompletion
	use "hrsh7th/nvim-cmp" -- The Completion Plugin
	use "hrsh7th/cmp-buffer" -- Buffer Completions
	use "hrsh7th/cmp-path" -- Path Completions
	use "saadparwaiz1/cmp_luasnip" -- Snippet Completions
	use "hrsh7th/cmp-nvim-lsp" -- LSP Support For CMP
	use "hrsh7th/cmp-nvim-lua" -- Lua Support For CMP
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- A Bunch Of Snippets To Use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
  use "glepnir/lspsaga.nvim" -- More functionality for LSP
	use "williamboman/mason.nvim" -- simple to use language server installer
	use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "folke/lsp-colors.nvim" -- Colors for LSP
  use "tamago324/nlsp-settings.nvim"

  -- Formatting and Linting
	use "jose-elias-alvarez/typescript.nvim"
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use "jayp0521/mason-null-ls.nvim"

	-- Telescope
	use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzf-native.nvim"
  use "ghassan0/telescope-glyph.nvim"
  use "xiyaowong/telescope-emoji.nvim"
  use "arjunmahishi/flow.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-project.nvim"

	-- Syntax Highlighting (Treesitter)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
	-- Git
  use 'lewis6991/gitsigns.nvim'


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)


