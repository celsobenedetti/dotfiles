-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt

opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.pumblend = 5

opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Size of an indent

vim.api.nvim_create_user_command("DiffThis", ":Gitsigns diffthis<CR>", { desc = "Git Diff current buffer" })

vim.api.nvim_create_user_command("FoldIndent", function()
  vim.opt.foldmethod = "indent"
end, { desc = "Set fold method indent" })

vim.api.nvim_create_user_command("FoldManual", function()
  vim.opt.foldmethod = "manual"
end, { desc = "Set fold method manual" })

vim.api.nvim_create_user_command("Oil", function()
  require("oil").open()
end, { desc = "Open oil.nvim" })
