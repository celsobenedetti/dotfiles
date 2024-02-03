local week = {
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
}

--- If file is a work-week file, go to section for current week day and unfold it
---@param file string name for current buffer
local function work_week(file)
  local is_work_week = string.match(file, "work") and string.match(file, "week")

  if is_work_week then
    vim.cmd("Twilight")
    local day = vim.fn.system("date +%u") + 1
    if day > #week then
      day = #week
    end

    -- close all folds
    vim.api.nvim_feedkeys("zM", "n", true)

    -- search for the day of the week
    local searchWeekDay = "/" .. week[tonumber(day)] .. "<CR>"
    vim.api.nvim_feedkeys(Escape(searchWeekDay), "n", true)

    -- unfold the day of the week
    vim.api.nvim_feedkeys("VzO", "n", true)
  end
end

return {
  work_week = work_week,
}
