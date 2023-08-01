-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lazy keys

vim.api.nvim_del_keymap("n", "<leader>ft")
vim.api.nvim_del_keymap("n", "<leader>fT")
vim.api.nvim_del_keymap("n", "<c-_>")
vim.api.nvim_del_keymap("n", "<c-/>")
vim.api.nvim_del_keymap("n", "<leader>l")

Map("<leader>la", "<cmd>Lazy<cr>", { desc = "Open lazy.nvim" })

-- my keys

local track_position_before_relative_jump = require("functions.relative_jump")

Map("<leader>wq", "<cmd>wqa<cr>", { desc = "Save all buffers" })

Map("<leader>todo", ":e $TODO<CR>", { mode = { "n", "v" } })
Map("<leader>wodo", ":e $WODO<CR>", { mode = { "n", "v" } })

Map("k", track_position_before_relative_jump.up)
Map("j", track_position_before_relative_jump.down)

-- Markdown
Map("<leader>xS", require("functions.markdown.misspelled_words").trouble, { desc = "Mispelled Words (Trouble)" })
Map("<leader>ll", require("functions.markdown.toggle_checkbox").toggle, { desc = "Toggle to-do checkbox (Markdown)" })
