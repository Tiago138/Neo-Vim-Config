local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"help",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"markdown",
		"graphql",
		"bash",
		"lua",
		"vim",
		"gitignore",
	},
	-- auto install above language parsers
	auto_install = true,
})
