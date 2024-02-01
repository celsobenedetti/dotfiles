-- global keumap function
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

Escape = function(str)
  return vim.api.nvim_replace_termcodes(str, false, false, true)
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.commands")
