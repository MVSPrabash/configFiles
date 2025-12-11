return {
  -- install gruvbox
  { "ellisonleao/gruvbox.nvim" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte | frappe | macchiato | mocha
      })
      vim.cmd.colorscheme("catppuccin")
    end
  },

  -- set it as default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

