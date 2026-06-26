return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      vim.g.undotree_DiffCommand = "C:\\Program Files\\Git\\usr\\bin\\diff.exe"
      vim.g.undotree_DiffAutoOpen = 0
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_DiffpanelHeight = 8
      vim.g.undotree_SplitWidth = 40
    end,
  },
  {
    "tommcdo/vim-fubitive",
    cmd = "Fubitive",
  },
}
