return {
	"neovim/nvim-lspconfig",
	event =  { "BufRead", "BufNewFile" },	-- lazy
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP References"
			keymap.set("n", "gR", "<cmd>Telescope lsp_reference<CR>", opts)		-- show definitions, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)	-- Go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)	-- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)	-- show lsp implementations

			opts.desc = "Smart Rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)		-- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- Used to enable autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			 capabilities = capabilities,
			 on_attach = on_attach,
		})

		-- typescript server
		lspconfig["ts_ls"].setup({
			 capabilities = capabilities,
			 on_attach = on_attach,
		})

		-- tailwingcss
		lspconfig["tailwindcss"].setup({
			 capabilities = capabilities,
			 on_attach = on_attach,
		})

		-- pyright for python
		lspconfig["pyright"].setup({
			 capabilities = capabilities,
			 on_attach = on_attach,
		})

		-- dart 
		lspconfig.dartls.setup({
			cmd = { "dart", "language-server", "--protocol=lsp" },  -- Specify the command to start Dart LSP
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				dart = {
					completeFunctionCalls = true,
				}
			}
		})
		-- clangd for C/C++
		lspconfig["clangd"].setup({
			 capabilities = capabilities,
			 on_attach = on_attach,
		})

		-- lua_ls for Lua
		lspconfig["lua_ls"].setup({
			 capabilities = capabilities,
			 on_attach = on_attach,
			 settings = {
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
	end
}

