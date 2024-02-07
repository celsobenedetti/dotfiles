local week = {
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
}

--- If file is a work-week file, go to section for current week day
local function find_today()
  local file = vim.fn.expand("%:t")
  if type(file) ~= "string" then
    return
  end

  local is_work_week = string.match(file, "work") and string.match(file, "week")

  if is_work_week then
    local day = vim.fn.system("date +%u") + 1
    if day > #week then
      day = #week
    end
    local searchWeekDay = "/" .. week[tonumber(day)] .. "<CR>"
    vim.api.nvim_feedkeys(Escape(searchWeekDay), "n", true)
    vim.api.nvim_feedkeys("zz", "n", true)
  end
end

return {
  find_today = find_today,
}
