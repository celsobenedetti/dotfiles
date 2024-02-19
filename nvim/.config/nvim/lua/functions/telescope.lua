local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

return {
  search_dotfiles = function()
    require("telescope.builtin").find_files({
      prompt_title = "< Dotfiles >",
      search_dirs = {
        "~/.dotfiles",
      },
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
    })
  end,

  -- opens telescope with each subdirectory of ~/Documents/notes
  -- moves the current file to the selected directory
  move_note = function(opts)
    local fd = "!fd . --type=directory -I hugo/ ~/Documents/notes/"
    local fd_result = vim.api.nvim_exec2(fd, { output = true })

    local dirs = vim.split(fd_result.output, "\n")
    dirs = vim.tbl_filter(function(item)
      return item ~= "" and not string.match(item, "--type=directory")
    end, dirs)

    pickers
      .new({}, {
        prompt_title = "Move file to directory",
        finder = finders.new_table({
          results = dirs,
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()

            local destination = selection[1]
            if not destination then
              return
            end

            local original_buffer = vim.api.nvim_get_current_buf()
            vim.cmd("silent! !mv % " .. destination)
            vim.cmd("e " .. destination .. "/" .. vim.fn.expand("%:t"))
            vim.api.nvim_buf_delete(original_buffer, { force = true })
          end)
          return true
        end,
      })
      :find()
  end,
}
