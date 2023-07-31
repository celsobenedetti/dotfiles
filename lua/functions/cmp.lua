local Util = require("lazy.core.util")
local cmp = require("cmp")

local enabled = true

return {
  toggle = function()
    enabled = not enabled
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup.buffer({ enabled = enabled })
    Util.info("Set autocomplete to " .. tostring(enabled) .. " (cmp)")
  end,
}
