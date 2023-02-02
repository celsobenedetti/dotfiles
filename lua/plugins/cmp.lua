local function cmp_format_source(_, item)
  local icons = require("lazyvim.config").icons.kinds

  icons.Snippet = " "
  icons.Function = " "
  icons.Copilot = " "

  if icons[item.kind] then
    item.kind = icons[item.kind] .. item.kind
  end
  return item
end

return {
  -- override nvim-cmp
  {
    "hrsh7th/nvim-cmp",

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      -- extend opts
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        -- { name = "copilot", group_index = 3 },
      }))

      --override opts
      opts.formatting = {
        format = cmp_format_source,
      }

      opts.experimental.ghost_text = false

      opts.window = {
        completion = cmp.config.window.bordered({ col_offset = -1 }),

        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
