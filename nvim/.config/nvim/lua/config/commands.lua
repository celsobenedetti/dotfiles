vim.api.nvim_create_user_command(
  "Clip",
  "!echo % | xclip -sel clip",
  { desc = "Copy file path to clipboard" }
)
