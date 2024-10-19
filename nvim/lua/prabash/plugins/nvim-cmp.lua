return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",	-- source for text in buffer
		"hrsh7th/cmp-path",		-- source for file system paths
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",		-- snippet engine
		"saadparwaiz1/cmp_luasnip",		-- autocomplete
		"rafamadriz/friendly-snippets",	-- useful snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load vs-code like plugins | friendly-snippets
		require("luasnip/loaders/from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"

		-- Look and Appearance : Color
		vim.api.nvim_set_hl(0, "MyNormal",		{ bg = "Black", fg = "White" })
		vim.api.nvim_set_hl(0, "MyFloatBorder",	{ bg = "Black", fg = "Green" })
		vim.api.nvim_set_hl(0, "MyCursorLine",	{ bg = "#aaafff", fg = "Black", bold = true, italic = true })

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			window = {
				completion = {
					border = nil,
					winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
				}
			},
			-- Source : https://www.youtube.com/watch?v=3O5aoxpdwqI&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN
			-- look and appearance : Borders
			-- window = {
			-- 	documentation = cmp.config.window.bordered();
			-- 	completion = cmp.config.window.bordered({
			-- 		winhighlight = "CursorLine:MyCursorLine,Search:None",
			-- 		border = nil,
			-- 	});
			-- 	-- completion = cmp.config.window.bordered({
			-- 	-- 	winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None"
			-- 	-- })
			-- 	-- documentation = cmp.config.window.bordered({}) for the documentation
			-- },
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-Tab>"] = cmp.mapping.scroll_docs(-4),
				["<C-S-Tab>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions

				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },	-- lsp
				{ name = "luasnip" },	-- snippets
				{ name = "buffer" },	-- text within current buffer
				{ name = "path" },		-- file system paths
			}),

			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			}
		})
	end,
}

