return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- LSPs
        "typescript-language-server",
        "eslint_d",
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        -- Formatters
        "prettier",
      })
    end,
  },
}
