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

Map("n", "nzz", { desc = "Jump to next occurence and center" })
Map("N", "Nzz", { desc = "Jumpt to prev occurence and center" })

Map("p", '"_dP', { mode = "v", desc = "Paste without losing register" }) --hold on to register when pasting and replace text
Map("<leader>p", '"_dP', { mode = "v", desc = "Paste without losing register" }) --hold on to register when pasting and replace text
Map("jk", "<esc>", { mode = "i", desc = "Escape insert mode" }) --hold on to register when pasting and replace text

Map("<leader>wq", "<cmd>wqa<cr>", { desc = "Save all buffers" })
Map("<leader>ww", ":e $CURR_WORK_WEEK<cr>", { desc = "Save all buffers" })

Map("<leader>todo", ":e $TODO<CR>", { mode = { "n", "v" } })
Map("<leader>wodo", ":e $WORK_TODO<CR>", { mode = { "n", "v" } })

Map("<leader>dd", ":bdelete<cr>", { desc = "Delete buffer" })

--hold on to register when pasting and replace text
Map("p", '"_dP', { mode = "v", desc = "Paste without losing register" })

-- delete word bacwards
Map("dw", "vbd", { desc = "Delete word backwards" })
Map("cw", "vbc", { desc = "Delete word backwards and go to insert mode" })

Map("<leader>T", "<cmd>!make test<CR>", { desc = "Run make test" })

local track_position_before_relative_jump = require("functions.relative_jump")
Map("k", track_position_before_relative_jump.up)
Map("j", track_position_before_relative_jump.down)

-- Markdown
Map(
  "<leader>xS",
  require("functions.markdown.misspelled_words").trouble,
  { desc = "Mispelled Words (Trouble)" }
)
Map(
  "<leader>ll",
  require("functions.markdown.toggle_checkbox").toggle,
  { desc = "Toggle to-do checkbox (Markdown)" }
)