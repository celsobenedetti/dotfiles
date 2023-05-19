-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

Map("<leader>tod", ":e $TODO<CR>", { mode = { "n", "v" } })

-- -- Unset bindings
-- vim.keymap.del("i", "<c-c>")
Map("<C-c>", "<Nop>", { desc = "Disable default <C-c>", mode = { "i", "v", "c" } })

Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Document" })
Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Range", mode = "v" })
Map("<leader>r", vim.lsp.buf.rename, { desc = "Rename" })

Map("gm", ":call cursor(0, len(getline('.'))/2)<CR>", { desc = "Go the middle of line" })

-- Navigate buffers
Map("<A-l>", ":bnext<CR>", { mode = { "n", "v" } })
Map("<A-h>", ":bprevious<CR>", { mode = { "n", "v" } })

--hold on to register when pasting and replace text
Map("p", '"_dP', { mode = "v", desc = "Paste without losing register" })

Map("<leader>ma", ":Mason<CR>")
Map("<leader>dif", ":Gitsigns diffthis<CR>")
Map("<leader>S", ":w<CR>")
Map("<leader>W", ":w<CR>")

Map("<leader>Q", ":bdelete<CR>")

Map("zf", ":set foldmethod=indent<CR>", { desc = "Enable indent folding" })

-- if doing relative jump, add current position to jump list
local function track_position_before_relative_jump(key)
  local count = vim.v.count or 1
  local orig_key = vim.api.nvim_replace_termcodes(key, true, true, true)
  if count > 1 then
    vim.api.nvim_feedkeys("m'", "n", true)
  end
  vim.api.nvim_feedkeys(count .. orig_key, "n", true)
end

Map("j", function()
  track_position_before_relative_jump("j")
end)

Map("k", function()
  track_position_before_relative_jump("k")
end)

Map("<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { mode = "i", desc = "Copilot Tab accept Suggestion" })

-- Markdown #############

local function get_misspelled_words_in_buffer()
  local misspelled_words = {}

  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Loop through each line in the buffer
  for i, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    -- Loop through each word in the line
    for word, _ in line:gmatch("(%w+)([%p%s]*)") do
      -- Check if the word is misspelled
      local result = vim.fn.spellbadword(word)
      if result[1] ~= "" then
        -- get the starting column for the word
        local start = string.find(line, word, 1, true)

        -- Add the misspelled word and its position to the list
        table.insert(misspelled_words, {
          word = word,
          pos = { i, start },
        })
      end
    end
  end

  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)

  -- Print and return the list of misspelled words
  return misspelled_words
end

local function trouble_mispelled_wods()
  local misspelled_words = get_misspelled_words_in_buffer()

  -- Create a quickfix list from the misspelled words
  local quickfix_list = {}
  for _, word_info in ipairs(misspelled_words) do
    local pos = word_info.pos

    table.insert(quickfix_list, {
      filename = vim.fn.expand("%"),
      lnum = pos[1],
      col = pos[2],
      text = word_info.word,
    })
  end

  -- Populate the quickfix list with the misspelled words
  vim.fn.setqflist({}, "r", {
    title = "Misspelled words",
    items = quickfix_list,
  })

  -- Open & close the quickfix window, run Trouble with the quickfix list
  vim.cmd("copen")
  vim.cmd("bdelete")
  vim.cmd("Trouble quickfix")
end

Map("<leader>xS", trouble_mispelled_wods, { desc = "Mispelled Words (Trouble)" })
Map("<leader>O", ":Oil<CR>", { desc = "Open parent directory" })
