------------------------PACKER-------------------------------------------------
local vim = vim
local fn = vim.fn

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
	print("Installing packer! Close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local packer, status_ok
status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install Plugins
packer.startup(function(use)
	--packer manages itself
	use("wbthomason/packer.nvim")

	-- is a dependency for pretty much everything
	use("nvim-lua/plenary.nvim")

	-- autopairs adds closing brackets / braces / quotes
	use("windwp/nvim-autopairs")

	-- auto-close and auto-rename html tags
	use("windwp/nvim-ts-autotag")

	-- dependency for a bunch of other stuff
	use("kyazdani42/nvim-web-devicons")
	use("onsails/lspkind.nvim")

	-- add some very nice commenting functiuonality
	use("numToStr/Comment.nvim")

	-- nice status bar
	use("nvim-lualine/lualine.nvim")

	-- all of our colors
	use("bluz71/vim-nightfly-guicolors")
	use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")

	-- editing html / parantheses / quotes / etc..
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	-- All of our completion engine plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	-- snippets for pretty much every language
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- our LSP plugin
	use("neovim/nvim-lspconfig")

	-- Telescope adds SO MUCH functionality through fzf searching
	-- it is much slower than fzf-lua but we'll ignore that for now...
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- git signs so we can see what changed
	use("lewis6991/gitsigns.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- treesitter gives us source code parsing
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")

	-- very handy tool to help align columnar data
	use({ "godlygeek/tabular" })

	-- move hella fast
	use("ggandor/lightspeed.nvim")

	-- inject LSP diagnostics from nvim via lua
	use("jose-elias-alvarez/null-ls.nvim")

	-- mason is a package manager for LSP servers, DAP servers, parsers, etc...
	use({ "williamboman/mason.nvim" })
	use("williamboman/mason-lspconfig.nvim")

	-- nice UIs for a bunch of stuff in nvim
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	})

	-- fast colorizer for color codes
	use("norcalli/nvim-colorizer.lua")

	-- c/cpp tools
	use("p00f/clangd_extensions.nvim")

	-- nice latex editing environment
	use("lervag/vimtex")

	-- live markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- handy to see which scope you are working in, especially for whitespace
	-- concious languages
	use("lukas-reineke/indent-blankline.nvim")

	-- the man, the myth, the legend
	use("github/copilot.vim")

	-- startup time
	use("dstein64/vim-startuptime")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
