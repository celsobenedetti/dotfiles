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

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.hurl",
  callback = function()
    vim.cmd("set filetype=hurl")
  end,
  desc = "Set hurl ft to .hurl files",
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.md",
  callback = function()
    vim.cmd("set syntax=markdown")
  end,
  desc = "Set markdown syntax on markdown files",
})
