return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    keys = {
      { "<leader>sf", function()
        local builtin = require("telescope.builtin")
        builtin.find_files({ cwd = vim.fn.getcwd() })
      end, desc = "Search files" },
      { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Search buffers" },
      { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Search help" },
      { "<leader>so", "<cmd>lua require('recent_files').open()<CR>", desc = "Recent files" },
      { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Search keymaps" },
      { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "Search diagnostics" },
      { "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
      { "<leader>sr", "<cmd>Telescope resume<CR>", desc = "Resume last picker" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", "build", "dist" },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-w>"] = actions.close,
            },
            n = {
              ["<C-w>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs" },
          },
          live_grep = { additional_args = function() return { "--hidden" } end },
        },
        extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown({}) } },
      })

      pcall(telescope.load_extension, "ui-select")

      require("recent_files").setup()
    end,
  },
}