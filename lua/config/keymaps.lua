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
Map("<leader>S", ":w<CR>")
Map("<leader>W", ":w<CR>")

Map("Q", ":bdelete<CR>")

-- if doing relative jump, add current position to jump list
local function track_position_before_relative_jump(key)
  local count = vim.v.count or 1
  local orig_key = vim.api.nvim_replace_termcodes(key, true, true, true)
  if count > 1 then
    vim.api.nvim_feedkeys("m'", "n", true)
  end
  vim.api.nvim_feedkeys(count .. orig_key, "n", true)
end

Map("j", function()
  track_position_before_relative_jump("j")
end)

Map("k", function()
  track_position_before_relative_jump("k")
end)

-- zk
Map("<leader>zn", ":ZkNotes<CR>", { mode = { "n", "v" } })
Map("<leader>zb", ":ZkBacklinks<CR>", { mode = { "n", "v" } })
Map("<leader>zl", ":ZkLinks<CR>", { mode = { "n", "v" } })
