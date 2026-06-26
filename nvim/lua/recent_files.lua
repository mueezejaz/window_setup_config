local recent_files = {}

local function track()
  local path = vim.api.nvim_buf_get_name(0)
  if path and path ~= "" then
    recent_files[#recent_files + 1] = path
  end
end

local M = {}

function M.setup()
  local group = vim.api.nvim_create_augroup("SessionRecentFiles", { clear = true })
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = group,
    callback = track,
  })
end

function M.open()
  if #recent_files == 0 then
    vim.notify("No files opened yet in this session", vim.log.levels.INFO)
    return
  end

  local seen, unique = {}, {}
  for i = #recent_files, 1, -1 do
    local p = recent_files[i]
    if not seen[p] then
      seen[p] = true
      unique[#unique + 1] = p
    end
  end

  local finders = require("telescope.finders")
  local pickers = require("telescope.pickers")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values

  pickers.new({}, {
    prompt_title = "Recent Files",
    finder = finders.new_table {
      results = unique,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry,
          ordinal = entry,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd("edit " .. vim.fn.fnameescape(selection.value))
      end)
      return true
    end,
  }):find()
end

return M