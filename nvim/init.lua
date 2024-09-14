-- Leader Key
vim.g.mapleader = " "           -- Space as leader key

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = false       -- Convert tabs to spaces, don't
vim.opt.shiftwidth = 4			-- indent width
vim.opt.tabstop = 4				-- Number of spaces for a tab
-- vim.opt.clipboard = "unnamedplus"	-- Use system clipboard


-- nasm syntax for asm files
vim.cmd("autocmd BufNew,BufRead *.asm set ft=nasm")




-- Lazy Nvim (Plugin Manager)

-- Installation: Check and install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set up
-- require("lazy").setup("plugins")	-- 'plugins' directory (lua/plugins)
-- require("lazy").setup("config")		-- 'config' directory (lua/config)

-- Ensure lazy.nvim is loaded before requiring other configs
require('lazy').setup({
  -- Plugin configurations (e.g., editor, ui)
  require('plugins.editor'),
  require('plugins.ui')
})

-- Load mappings
require('config.mappings')



