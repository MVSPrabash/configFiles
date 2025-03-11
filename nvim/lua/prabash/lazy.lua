
-- Installation of Lazy - Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",	-- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup
require("lazy").setup(
{
	{ import = "prabash.plugins" },
	{ import = "prabash.plugins.lsp" }
},

{
	install = {		-- colorscheme during installations
		colorscheme = { "jellybeans" },
	},
	checker = {		-- Checks for updates when opened
		enabled = true,
		notify = false,
	},
	change_detection = { -- Don't notify when config is changed
		notify = false,
	},
}

)

