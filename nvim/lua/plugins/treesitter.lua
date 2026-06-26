return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate" },
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "javascript", "jsx", "typescript", "tsx" },
        indent = { enable = true },
      })
    end,
  },
}
