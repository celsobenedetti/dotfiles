-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- -- Unset LazyVim's default bindings
-- vim.keymap.del("i", "<c-k>")

Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Document" })
Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Range", mode = "v" })
Map("R", require("lazyvim.plugins.lsp.keymaps").rename, { desc = "Rename" })

-- Navigate buffers
Map("<A-l>", ":bnext<CR>", { mode = { "n", "v" } })
Map("<A-h>", ":bprevious<CR>", { mode = { "n", "v" } })

Map("p", '"_dP', { mode = "v", desc = "Paste without losing register" }) --hold on to register when pasting and replace text

Map("<leader>ma", ":Mason<CR>")
Map("<leader>dif", ":Gitsigns diffthis<CR>")

Map("Q", ":bdelete<CR>")
