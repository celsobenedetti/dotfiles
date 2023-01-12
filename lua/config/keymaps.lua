-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Document" })
Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Range", mode = "v" })
Map("R", require("lazyvim.plugins.lsp.keymaps").rename, { desc = "Rename" })

--ThePrimeagen
Map("<leader>x", '"_d', { mode = { "v", "n" } })
Map("<leader>p", '"_dP', { mode = "x" })

-- Navigate buffers
Map("<A-l>", ":bnext<CR>", { mode = { "n", "v" } })
Map("<A-h>", ":bprevious<CR>", { mode = { "n", "v" } })

Map("<leader>ma", ":Mason<CR>")

Map("Q", ":bdelete<CR>")

