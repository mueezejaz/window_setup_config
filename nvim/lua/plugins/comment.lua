return {
  "numToStr/Comment.nvim",
  keys = {
    { "gc", mode = { "n", "x" }, desc = "Toggle comment" },
  },
  config = function()
    require("Comment").setup()
  end,
}