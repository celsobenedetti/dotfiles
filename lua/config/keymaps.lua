-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- -- Unset bindings
-- vim.keymap.del("i", "<c-c>")
Map("<C-c>", "<Nop>", { desc = "Disable default <C-c>", mode = { "i", "v", "c" } })

Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Document" })
Map("<A-F>", require("lazyvim.plugins.lsp.format").format, { desc = "Format Range", mode = "v" })
Map("<leader>r", vim.lsp.buf.rename, { desc = "Rename" })

Map("gm", ":call cursor(0, len(getline('.'))/2)<CR>", { desc = "Go the middle of line" })

-- Navigate buffers
Map("<A-l>", ":bnext<CR>", { mode = { "n", "v" } })
Map("<A-h>", ":bprevious<CR>", { mode = { "n", "v" } })

--hold on to register when pasting and replace text
Map("p", '"_dP', { mode = "v", desc = "Paste without losing register" })

Map("<leader>ma", ":Mason<CR>")
Map("<leader>dif", ":Gitsigns diffthis<CR>")

Map("Q", ":bdelete<CR>")
