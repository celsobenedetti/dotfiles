local Util = require("lazy.core.util")
local cmp = require("cmp")

local enabled = true
local augroupName = "cmp-augroup"
local augroup = vim.api.nvim_create_augroup(augroupName, { clear = true })

local toggle_completion = function(is_enabled)
  ---@diagnostic disable-next-line: missing-fields
  cmp.setup.buffer({ enabled = is_enabled })
end

return {
  toggle = function()
    enabled = not enabled
    toggle_completion(enabled)

    if enabled then
      Util.info("Enabled completion (cmp)")
      vim.api.nvim_clear_autocmds({ group = augroupName })
    else
      vim.api.nvim_create_autocmd("BufEnter", {
        desc = ("Disable completion: %s"):format("BufEnter"),
        group = augroup,
        callback = function()
          toggle_completion(false)
        end,
      })
      Util.warn("Disabled completion (cmp)")
    end
  end,
}
