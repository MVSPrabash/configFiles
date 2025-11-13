return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
        "lua",
        "vim",
        "python",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
      })
    end,
  },
}
