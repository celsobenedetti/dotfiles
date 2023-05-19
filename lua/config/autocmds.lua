-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- require("lazyvim.plugins.lsp.format").autoformat = false

vim.cmd("autocmd FileType help wincmd L")
vim.cmd("autocmd FileType qf wincmd L") -- hurl
vim.cmd("autocmd FileType man wincmd L") -- man

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

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.gohtml",
  callback = function()
    vim.cmd("set filetype=html")
  end,
  desc = "Set html ft to gohtml files",
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.hurl",
  callback = function()
    vim.cmd("set filetype=hurl")
  end,
  desc = "Set hurl ft to .hurl files",
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.norg",
  callback = function()
    vim.cmd("set filetype=norg")
  end,
  desc = "Set norg ft to .norg files",
})


vim.api.nvim_create_autocmd("BufRead", {
  pattern = "Caddyfile*",
  callback = function()
    vim.cmd("set filetype=caddyfile")
  end,
  desc = "Set Caddyfile ft to Caddyfile files",
})
