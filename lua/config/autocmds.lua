-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- require("lazyvim.plugins.lsp.format").autoformat = false

vim.cmd("autocmd FileType help wincmd L")

-- run on every file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    --[[ Stop comment continuation on line below and global statusline ]]
    vim.cmd("setlocal formatoptions-=cro")
    --[[ vim.cmd("set laststatus=3") ]]
    --[[ vim.o.ch = 0 ]]
  end,
  desc = "Run on every file",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.gohtml",
  callback = function()
    vim.cmd("set filetype=html")
  end,
  desc = "Set html ft to gohtml files",
})
