return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    opts = {},
    keys = {
      {
        "<leader>md",
        function()
          local ok, _ = pcall(vim.cmd, "RenderMarkdown toggle")
          if not ok then
            require("render-markdown").toggle()
          end
        end,
        desc = "Toggle markdown render",
      },
    },
  },
}
