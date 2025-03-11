-- Leader Key
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = false       -- Convert tabs to spaces, don't
vim.opt.shiftwidth = 4					-- indent width
vim.opt.tabstop = 4						-- Number of spaces for a tab
-- vim.opt.clipboard = "unnamedplus"    -- Use system clipboard (leader key to use clipboard)
										-- core.keymaps.lua
vim.opt.encoding = "utf-8"	-- Unicode

-- nasm syntax for asm files
-- vim.cmd("autocmd BufNew,BufRead *.asm set ft=nasm")


-- Copy, Cut and Paste to Clipboard
-- Explicit control

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copy selected text to clipboard
map('v', '<leader>y', '"+y', opts)

-- Paste from clipboard
map('n', '<leader>p', '"+p', opts)
map('v', '<leader>p', '"+p', opts)

-- Copy the entire file to clipboard
map('n', '<leader>Y', 'gg"+yG', opts)

