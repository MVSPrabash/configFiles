return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup {
			options = {
				theme = "gruvbox",    -- Set theme (gruvbox, dracula, etc.)
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
			}
		}
	end
}

