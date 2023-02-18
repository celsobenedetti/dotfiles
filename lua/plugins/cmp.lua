local function cmp_format_source(entry, item)
  local icons = require("lazyvim.config").icons.kinds

  icons.Snippet = " "
  icons.Function = " "
  icons.Copilot = " "

  if icons[item.kind] then
    item.kind = icons[item.kind] .. item.kind
  end

  require("tailwindcss-colorizer-cmp").formatter(entry, item)

  return item
end

return {
  -- override nvim-cmp
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },

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
