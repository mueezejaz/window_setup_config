vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-2>", "<C-w>", { noremap = true, silent = true, desc = "Window commands (alt Ctrl+W)" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
vim.keymap.set("n", "<leader>d", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>x", "<C-w>c", { noremap = true, silent = true, desc = "Close current split" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true, silent = true })

vim.keymap.set("n", "fj", "<cmd>b#<CR>", { noremap = true, silent = true, desc = "Switch between recent files" })
vim.keymap.set("n", "<leader>w", ":bd<CR>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true, desc = "Open netrw (:Ex)" })
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle undotree" })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Gitsigns
vim.keymap.set("n", "<leader>gs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff this" })
vim.keymap.set("n", "<leader>gD", function()
  require("gitsigns").diffthis("~")
end, { desc = "Diff this ~" })
vim.keymap.set("n", "<leader>gu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
vim.keymap.set("n", "<leader>gU", function()
  require("gitsigns").reset_buffer_index()
end, { desc = "Unstage buffer" })
vim.keymap.set("n", "<leader>gc", function()
  require("telescope.builtin").git_commits({
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        if selection then
          require("gitsigns").diffthis(selection.value)
        end
      end)
      return true
    end,
  })
end, { desc = "Diff against selected commit" })

vim.keymap.set("n", "]g", function()
  if vim.wo.diff then
    return "]g"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { expr = true, desc = "Next hunk" })
vim.keymap.set("n", "[g", function()
  if vim.wo.diff then
    return "[g"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { expr = true, desc = "Prev hunk" })
