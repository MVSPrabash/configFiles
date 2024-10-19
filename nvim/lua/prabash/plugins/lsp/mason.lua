return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and config the icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✔",
					package_pending = "↪",
					package_uninstalled = "✗",
				}
			}
		})

		mason_lspconfig.setup({
			-- List of servers for mason to install
			ensure_installed = {
				"clangd",		-- C/C++
				"ts_ls",		-- Typescript, Javascript
				"html",
				"cssls",		-- CSS
				"tailwindcss",	-- CSS frontend
				"svelte", -- Frontend Cybernetically enhanced web apps
				"lua_ls",
				"pyright",
			},
			-- auto install (lspconfig)
			automatic_installation = true,
		})

	end,
}
