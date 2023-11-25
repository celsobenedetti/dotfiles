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

local trouble_mispelled_wods = function()
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

return { trouble = trouble_mispelled_wods }
