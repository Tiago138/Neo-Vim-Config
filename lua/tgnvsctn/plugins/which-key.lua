local which_key_setup, which_key = pcall(require, "which-key")
if not which_key_setup then
	return
end

local mappings = {
	w = { ":w", "Save" },
	c = { "<Cmd>BufferClose<CR>", "Close Buffer" },
	h = { "<Cmd>BufferPrevious<CR>", "Previous Buffer" },
	l = { "<Cmd>BufferNext<CR>", "Next Buffer" },
	e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	["+"] = { "<C-a>", "Increase Number" },
	["-"] = { "<C-x>", "Decrease Number" },
	y = { '"+y', "Copy to System Clipboard" },
	Y = { '"+Y', "Copy to System Clipboard" },
	f = {
		name = "Search",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		s = { "<cmd>Telescope live_grep<cr>", "Find String" },
		c = { "<cmd>Telescope grep_string<cr>", "Find String Under Cursor" },
		b = { "<cmd>Telescope buffers<cr>", "List Open Buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
	},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

which_key.setup()

which_key.register(mappings, opts)
