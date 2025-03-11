return {
	{
		-- Jellybeans from nanotech
		'nanotech/jellybeans.vim',
		config = function()
			vim.cmd('colorscheme jellybeans')
		end
	},

	-- {
	-- 	"ellisonleao/gruvbox.nvim",			-- Color scheme: gruv box
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd('colorscheme gruvbox')
	-- 		vim.cmd("highlight Normal guibg=#000000")
	-- 		-- vim.cmd("highlight VertSplit guibg=#000000 guifg=#000000")  -- Black bg for split line
	-- 		-- vim.cmd("highlight StatusLine guibg=#000000 guifg=#d4be98") -- Status line for active window
	-- 		-- vim.cmd("highlight StatusLineNC guibg=#000000 guifg=#928374") -- Status line for inactive window
	-- 	end
	-- },
	-- {									-- Transparent Background
	-- 	"xiyaowong/transparent.nvim",
	-- 	config = function ()
	-- 		vim.cmd('TransparentEnable')
	-- 	end
	-- },

	-- {
	-- 	"sainnhe/everforest",
	-- 	config = function ()
	-- 		vim.cmd("let g:everforest_background = 'Hard'")
	-- 		vim.cmd("let g:everforest_current_word = 'underline'")
	-- 		vim.cmd("colorscheme everforest")
	-- 	end
	-- },


	-- "bluz71/vim-nightfly-guicolors",
	-- priority = 1000,	-- Load this before all the others
	-- config = function()
		-- vim.cmd([[colorscheme nightfly]])
	-- end,
}
