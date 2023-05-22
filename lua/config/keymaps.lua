-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local f = require("config.functions")

Map("<leader>tod", ":e $TODO<CR>", { mode = { "n", "v" } })

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
Map("<leader>S", ":w<CR>")
Map("<leader>W", ":w<CR>")

Map("<leader>Q", ":bdelete<CR>")

Map("zf", ":set foldmethod=indent<CR>", { desc = "Enable indent folding" })

Map("j", function()
  f.track_position_before_relative_jump("j")
end)

Map("k", function()
  f.track_position_before_relative_jump("k")
end)

Map("<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { mode = "i", desc = "Copilot Tab accept Suggestion" })

Map("<leader>xS", f.trouble_mispelled_wods, { desc = "Mispelled Words (Trouble)" })
Map("<leader>O", ":Oil<CR>", { desc = "Open parent directory" })
