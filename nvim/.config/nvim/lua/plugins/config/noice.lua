return {
  opts = function(_, opts)
    opts.presets.bottom_search = true -- use a classic bottom cmdline for search
    opts.presets.lsp_doc_border = true -- add a border to hover docs and signature help
    opts.presets.command_palette = false -- position the cmdline and popupmenu together
    opts.presets.long_message_to_split = true -- long messages will be sent to a split

    opts.lsp.signature = {
      enabled = false, -- use lsp_signature.nvim instead
    }

    -- ignore notifications which contain any of these
    local ignore_notifications = {
      { "notify", "No information available" },
      { "notify", "Config Change" },
      { "notify", "'NotifyBackground' has no background highlight" },
      { "notify", "Set conceallevel to" },
      { "notify", "Plugin Updates" },
      { "msg_show", "search hit BOTTOM, continuing at TOP" },
      { "msg_show", "Pattern not found" },
      { "msg_show", "invalid node type" },
      { "msg_show", "Keyboard interrupt" },
      { "msg_show", ":qa" },
      { "msg_show", "Error in decoration provider" },
      { "msg_show", "obsidian/async.lua" },
      { "msg_show", "Error executing vim.schedule lua callback" },
      { "msg_show", "Error detected while processing TextChangedI Autocommands" },
      { "msg_show", "Formatter" },
    }

    for _, filter in ipairs(ignore_notifications) do
      table.insert(opts.routes, {
        filter = {
          event = filter[1],
          find = filter[2],
        },
        opts = { skip = true },
      })
    end
  end,
}
