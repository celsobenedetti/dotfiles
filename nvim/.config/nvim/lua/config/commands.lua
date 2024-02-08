local tmux_popup = "!tmux popup -h 90\\% -w 80\\% "

vim.api.nvim_create_user_command(
  "Clip",
  "!echo % | xclip -sel clip",
  { desc = "Copy file path to clipboard" }
)

-- opens tmux popup with git diff
vim.api.nvim_create_user_command(
  "Diff",
  tmux_popup .. "git diff %",
  { desc = "Copy git diff to clipboard" }
)

-- prompts the user for log depth, then opens tmux popup with git log -p
vim.api.nvim_create_user_command("Log", function()
  local depth = vim.fn.input("Git log depth: ", "", "file")
  vim.cmd(tmux_popup .. "git log -p -n " .. depth .. " %")
end, { desc = "Copy git diff to clipboard" })
