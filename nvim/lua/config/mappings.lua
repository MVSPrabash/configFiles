-- lua/config/mappings.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copy selected text to clipboard
map('v', '<leader>y', '"+y', opts)

-- Paste from clipboard
map('n', '<leader>p', '"+p', opts)
map('v', '<leader>p', '"+p', opts)

-- Copy the entire file to clipboard
map('n', '<leader>Y', 'gg"+yG', opts)

