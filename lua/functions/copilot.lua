return {
  open_copilot_panel = function()
    vim.cmd("vsplit")
    local win = vim.api.nvim_get_current_win()
    vim.cmd("Copilot panel")
    vim.api.nvim_win_close(win, false)

    Map("<M-[>", require("copilot.panel").jump_prev, { desc = "Jump Prev (Copilot Panel)" })
    Map("<M-]>", require("copilot.panel").jump_next, { desc = "Jump Next (Copilot Panel)" })
  end,

  setup = function()
    vim.schedule(function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            -- jump_prev = "<M-[>",
            -- jump_next = "<M-]>",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        suggestion = {
          accept = false,
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end)
  end,
}
