local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local which_key_setup, which_key = pcall(require, "which-key")
if not which_key_setup then
	return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	-- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	-- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	-- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	-- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	-- keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	-- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	-- keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	-- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	-- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	local mappings = {
		l = {
			name = "LSP",
			f = { "<cmd>Lspsaga lsp_finder<CR>", "Show Definition, References" },
			D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration" },
			d = { "<cmd>Lspsaga peek_definition<CR>", "See Definition" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
			a = { "<cmd>Lspsaga code_action<CR>", "See Available Code Actions" },
			n = { "<cmd>Lspsaga rename<CR>", "Smart Rename" },
			l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Diagnostics for Line" },
			c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Diagnostics for Cursor" },
			K = { "<cmd>Lspsaga hover_doc<CR>", "Show documentation for what is under the cursor" },
		},
	}

	local mappings_opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	which_key.register(mappings, mappings_opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
