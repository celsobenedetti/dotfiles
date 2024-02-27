local tmux_popup = "!tmux popup -h 90\\% -w 80\\% "

vim.api.nvim_create_user_command("Clip", "!echo % | xclip -sel clip", {})

-- opens tmux popup with git diff
vim.api.nvim_create_user_command("Diff", tmux_popup .. "git diff %:p", {})

-- prompts the user for log depth, then opens tmux popup with git log -p
vim.api.nvim_create_user_command("Log", function()
  local depth = vim.fn.input("Git log depth: ", "", "file")
  vim.cmd(tmux_popup .. "git log -p -n " .. depth .. " %:p")
end, {})

-- opens current file in glow
vim.api.nvim_create_user_command("Glow", tmux_popup .. "glow %:% -p", {})
-- run bash on current line

vim.api.nvim_create_user_command("Bash", ".!bash", {})

vim.api.nvim_create_user_command("Note", "!tmux neww note.sh", {})
