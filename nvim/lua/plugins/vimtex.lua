return {
  {
    "lervag/vimtex",
    lazy = false,  -- load immediately
    init = function()
      -- Set compiler
      vim.g.vimtex_compiler_method = "latexmk"

      -- Use Zathura (or any PDF viewer you like)
      vim.g.vimtex_view_method = "zathura"

      -- Auto open quickfix for errors
      vim.g.vimtex_quickfix_mode = 1

      -- Turn on syntax highlighting
      vim.g.vimtex_syntax_enabled = 1
    end,
  },
}
