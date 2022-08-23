local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_configplug
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
	use "windwp/nvim-autopairs" -- Auto pairs, integrates with both cmp and treesitter
	use "windwp/nvim-ts-autotag"
	use "numToStr/Comment.nvim" -- Easily comment stuff
	use "kyazdani42/nvim-web-devicons"
	use "kyazdani42/nvim-tree.lua"
	use "akinsho/bufferline.nvim"
	use "moll/vim-bbye"
	use "nvim-lualine/lualine.nvim"
	use "ahmedkhalf/project.nvim"
	use "lewis6991/impatient.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "goolord/alpha-nvim"
	use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use "folke/which-key.nvim"
	use {
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" },
	}
	use "karb94/neoscroll.nvim"
	use "kylechui/nvim-surround"
	use "ggandor/leap.nvim"

	-- Colorschemes
	use {
		"sainnhe/everforest",
		as = "everforest",
	}
	use { "rose-pine/neovim", as = "rose-pine" }
	use "EdenEast/nightfox.nvim"

	-- Cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
	use "ray-x/lsp_signature.nvim"

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	-- use 'nvim-telescope/telescope-media-files.nvim'

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "p00f/nvim-ts-rainbow"
	use "JoosepAlviste/nvim-ts-context-commentstring" -- for commenting JSX
	-- use "nvim-treesitter/playground"

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- Typescript
	use "jose-elias-alvarez/typescript.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
