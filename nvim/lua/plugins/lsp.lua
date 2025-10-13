return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
          },
          init_options = {
            completeUnimported = false,
          },
        },

        -- Web Dev Setup
        html = {},
        cssls = {},
        ts_ls = {
          settings = {
            javascript = { format = { enable = true } },
            typescript = { format = { enable = true } },
          },
        },
        emmet_ls = {
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
          },
        },
      },  -- servers
    }, -- opts
  },
}
