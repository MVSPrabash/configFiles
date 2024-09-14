return {
	{
		"nanotech/jellybeans.vim",  -- Jellybeans themeconfig
		config = function()
			vim.cmd("colorscheme jellybeans")  -- Set the colorscheme to Jellybeans
		end
	},
	-- {
	-- 	"ellisonleao/gruvbox.nvim",			-- Color scheme: gruv box
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end
	-- },
	{
		"nvim-lualine/lualine.nvim",		-- Status line
		dependencies = { "kyazdani42/nvim-web-devicons" },
		-- set up function
		config = function()
			require("lualine").setup {
				options = {
					theme = "jellybeans",    -- Set theme (gruvbox, dracula, etc.)
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' },
				}
			}
		end
	},
	{
		"nvim-telescope/telescope.nvim",	-- Fuzzy finder
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup {
				defaults = {
					prompt_prefix = "> ",
					selection_caret = "> ",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							preview_width = 0.6,
						},
					},
				}
			}
			-- Optional keybindings for Telescope
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		end
	},
	{
    	"nvim-tree/nvim-tree.lua",			-- File explorer
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup {
				view = {
					width = 30,
					side = "left",
					-- adaptive_size replaces the old auto_resize functionality
					adaptive_size = true,  -- Auto-adjust width based on content
				},
				filters = {
					dotfiles = false,
				},
				git = {
					enable = true,
					ignore = false,
				},
			}
			-- Keybindings for nvim-tree
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end
	}
}
