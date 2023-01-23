local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- maximizes and restores current window
	use("szw/vim-maximizer")

	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	--icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("feline-nvim/feline.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- -- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- -- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formating & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git
	use("lewis6991/gitsigns.nvim")

	use("folke/which-key.nvim")

	use("danilamihailov/beacon.nvim")

	use("lukas-reineke/indent-blankline.nvim")

	use("j-hui/fidget.nvim")

	use("romgrk/barbar.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
