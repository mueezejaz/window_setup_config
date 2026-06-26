return {
  {
    name = "terminal",
    dir = vim.fn.stdpath("config"),
    lazy = true,
    keys = {
      { "<C-S-j>", desc = "Toggle terminal split" },
      { "<C-S-n>", desc = "Toggle terminal" },
      { "<C-S-]>", desc = "Next terminal" },
      { "<C-S-[>", desc = "Prev terminal" },
      { "<leader>tt", desc = "List terminals" },
      { "<leader><leader>", desc = "List terminals" },
    },
    config = function()
      require("terminal")
    end,
  },
}