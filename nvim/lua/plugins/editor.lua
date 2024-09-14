-- plugins/editor.lua

return {
	-- Syntax Highlighting: Treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Languages you use
				highlight = {
					enable = true,              -- Enable syntax highlighting
					additional_vim_regex_highlighting = false,
				},
			}
		end
	},

	-- Autopairs: Automatically close pairs like brackets, quotes
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",  -- Load when entering insert mode
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	
	-- Commenting: Toggle comments easily
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},


	-- Auto Complete Plugins and settings
	
	-- LSP configurations
	{
		"neovim/nvim-lspconfig",  -- Collection of configurations for built-in LSP client
		config = function()
			local lspconfig = require("lspconfig")

			-- Enable language servers with the additional completion capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
	
			-- C/C++: clangd LSP
			lspconfig.clangd.setup {
				capabilities = capabilities,
			}
	
			-- Python: pyright LSP
			lspconfig.pyright.setup {
				capabilities = capabilities,
			}
	
			-- HTML/CSS/JS: html, cssls, ts_ls (TypeScript/JavaScript)
			lspconfig.html.setup {
				capabilities = capabilities,
			}
			lspconfig.cssls.setup {
				capabilities = capabilities,
			}
			lspconfig.ts_ls.setup {
				capabilities = capabilities,
			}
		end
	},
	
	-- Autocompletion setup
	{
		"hrsh7th/nvim-cmp",  -- Autocompletion plugin
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer",    -- Buffer completion source
			"hrsh7th/cmp-path",      -- Path completion source
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup {
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)  -- If using vsnip for snippets
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-Tab>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },   -- LSP completions
					{ name = "buffer" },     -- Buffer completions
					{ name = "path" },       -- Path completions
				})
			}
		end
	},

	-- Optionally, a snippet plugin (vsnip, luasnip, etc.)
	{
		"hrsh7th/vim-vsnip",  -- Snippet engine
		dependencies = { "hrsh7th/vim-vsnip-integ" }
	}
}

