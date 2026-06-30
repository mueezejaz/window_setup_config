local terminals = {}
local term_index = 1
local active_term = nil
local term_mru = {}
local mru_counter = 0


local function update_term_mru(buf)
  mru_counter = mru_counter + 1
  term_mru[buf] = mru_counter
end

local function set_active_highlight(idx)
  if active_term and terminals[active_term] and terminals[active_term].win then
    local prev_win = terminals[active_term].win
    if prev_win and vim.api.nvim_win_is_valid(prev_win) then
      pcall(function()
        vim.wo[prev_win].winhl = ""
      end)
    end
  end
  active_term = idx
end

local function toggle_terminal(idx, force_split)
  idx = idx or term_index
  local t = terminals[idx]

  if t and t.win and vim.api.nvim_win_is_valid(t.win) then
    vim.api.nvim_win_close(t.win, true)
    terminals[idx].win = nil
  elseif t and t.buf and vim.api.nvim_buf_is_valid(t.buf) then
    if force_split then
      vim.cmd("split")
      terminals[idx].win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(terminals[idx].win, t.buf)
    else
      vim.api.nvim_set_current_buf(t.buf)
      terminals[idx].win = vim.api.nvim_get_current_win()
    end
    vim.cmd("startinsert!")
  else
    if force_split then
      vim.cmd("split | terminal")
      vim.cmd("resize 15")
    else
      vim.cmd("terminal")
    end
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert!")
    terminals[idx] = { buf = buf, win = win }
  end

  term_index = idx
  set_active_highlight(term_index)
end

local function get_terminal_bufs()
  local bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      table.insert(bufs, buf)
    end
  end
  return bufs
end

local function next_terminal()
  local bufs = get_terminal_bufs()
  if #bufs == 0 then
    toggle_terminal(1, true)
    return
  end
  local cur = vim.api.nvim_get_current_buf()
  local idx = 0
  for i, buf in ipairs(bufs) do
    if buf == cur then idx = i; break end
  end
  term_index = (idx % #bufs) + 1
  vim.api.nvim_set_current_buf(bufs[term_index])
  vim.cmd("startinsert!")
end

local function prev_terminal()
  local bufs = get_terminal_bufs()
  if #bufs == 0 then
    toggle_terminal(1, true)
    return
  end
  local cur = vim.api.nvim_get_current_buf()
  local idx = 1
  for i, buf in ipairs(bufs) do
    if buf == cur then idx = i; break end
  end
  term_index = ((idx - 2 + #bufs) % #bufs) + 1
  vim.api.nvim_set_current_buf(bufs[term_index])
  vim.cmd("startinsert!")
end

local function telescope_terminals()
  local entries = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
      if name == "" then
        name = "Terminal " .. buf
      end
      local is_active = (buf == vim.api.nvim_get_current_buf())
      table.insert(entries, {
        buf = buf,
        display = (is_active and "● " or "  ") .. name,
      })
    end
  end

  if #entries == 0 then
    return
  end

  table.sort(entries, function(a, b)
    return (term_mru[a.buf] or 0) > (term_mru[b.buf] or 0)
  end)

  pcall(require, "telescope")

  vim.ui.select(entries, {
    prompt = "Terminals",
    format_item = function(entry)
      return entry.display
    end,
  }, function(choice)
    if choice then
      vim.api.nvim_set_current_buf(choice.buf)
      if vim.bo[choice.buf].buftype == "terminal" then
        vim.cmd("startinsert!")
      end
    end
  end)
end

vim.keymap.set("n", "<C-S-j>", function()
  toggle_terminal(term_index, true)
end, { noremap = true, silent = true })

vim.keymap.set("t", "<C-S-j>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
  toggle_terminal(term_index, true)
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-S-n>", function()
  toggle_terminal(1, vim.bo.buftype ~= "terminal")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-S-]>", next_terminal, { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-[>", prev_terminal, { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-i>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-d>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-S-i>", [[<C-\><C-n>:resize +2<CR>i]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-S-d>", [[<C-\><C-n>:resize -2<CR>i]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tt", telescope_terminals, { noremap = true, silent = true, desc = "List terminals" })
vim.keymap.set("n", "<leader><leader>", telescope_terminals, { noremap = true, silent = true, desc = "List terminals" })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function(args)
    if vim.bo[args.buf].buftype == "terminal" then
      update_term_mru(args.buf)
    end
  end,
})

vim.api.nvim_create_autocmd("WinClosed", {
  pattern = "*",
  callback = function()
    for idx, t in pairs(terminals) do
      if t and t.win and not vim.api.nvim_win_is_valid(t.win) then
        terminals[idx].win = nil
      end
    end
    if active_term and terminals[active_term] and terminals[active_term].win == nil then
      set_active_highlight(nil)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWipeout", "BufDelete" }, {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    if not buf then
      return
    end
    for idx, t in pairs(terminals) do
      if t and t.buf == buf then
        terminals[idx] = nil
        if term_index == idx then
          term_index = 1
        end
      end
    end
  end,
})

local function cleanup_terminals_table()
  for idx, t in pairs(terminals) do
    if not (t and t.buf and vim.api.nvim_buf_is_valid(t.buf)) then
      terminals[idx] = nil
    else
      if not (t.win and vim.api.nvim_win_is_valid(t.win)) then
        terminals[idx].win = nil
      end
    end
  end
end
cleanup_terminals_table()
