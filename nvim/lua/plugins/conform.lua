return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = { lsp_fallback = true, timeout_ms = 200 },
      formatters_by_ft = {
        lua = { "stylua" },
        c = {},
        cpp = {},
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}
