-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
vim.api.nvim_create_user_command("DiffThis", ":Gitsigns diffthis<CR>", { desc = "Git Diff current buffer" })

-- run on every file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("setlocal formatoptions-=cro")
  end,
  desc = "Stop comment continuation on line below",
})
