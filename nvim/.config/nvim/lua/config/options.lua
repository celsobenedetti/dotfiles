-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- false actually enables perf kekw
vim.g.perf = false

vim.g.disable_tailwind = true

vim.g.autoformat = true

vim.opt.swapfile = false
vim.opt.pumblend = 0 -- disable transparent completion menu

vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 4 -- Size of an indent

vim.o.conceallevel = 2

-- open buffers verticaly
vim.cmd("autocmd FileType help wincmd L") --help
vim.cmd("autocmd FileType man wincmd L") -- man
vim.cmd("autocmd FileType qf wincmd L") -- hurl
