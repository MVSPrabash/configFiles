return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = { "lua", "python", "javascript", "html", "css", "cpp", "c", }, -- Languages you use
			highlight = {
				enable = true,              -- Enable syntax highlighting
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
