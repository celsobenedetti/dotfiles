-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local track_position_before_relative_jump = require("functions.relative_jump")

function Map(lhs, rhs, opts)
  local mode = "n"
  local options = { noremap = true, silent = true }
  if opts then
    if opts.mode then
      mode = opts.mode
      opts.mode = nil
    end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Map("k", track_position_before_relative_jump.up)
Map("j", track_position_before_relative_jump.down)
