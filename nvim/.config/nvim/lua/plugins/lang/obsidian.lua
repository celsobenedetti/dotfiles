return {
  {
    "epwalsh/obsidian.nvim",
    -- commit = "06154ec6f2964632d53c8fea9f0c175f31357192",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    cond = function()
      local path = vim.fn.expand("%:p:h")
      return not string.match(path, "templates")
    end,
    keys = {
      { "<leader>zz", ":ObsidianSearch<CR>" },
      { "<leader>oo", ":ObsidianOpen<CR>" },
      { "<leader>ob", ":ObsidianBacklinks<CR>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
      opts.new_notes_location = "notes_subdir"
      opts.workspaces = {
        {
          name = "notes",
          path = "~/Documents/notes",
          overrides = {
            notes_subdir = "0-inbox",
          },
        },
      }
      -- opts.ui = {
      --   enable = true, -- set to false to disable all additional syntax features
      --   update_debounce = 200, -- update delay after a text change (in milliseconds)
      --   checkboxes = {
      --     [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      --     [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      --     ["~"] = { char = "x", hl_group = "ObsidianTilde" },
      --     ["-"] = { char = "x", hl_group = "ObsidianTilde" },
      --     ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      --   },
      --   bullets = { char = "•", hl_group = "ObsidianBullet" },
      --   external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      --   reference_text = { hl_group = "ObsidianRefText" },
      --   highlight_text = { hl_group = "ObsidianHighlightText" },
      --   tags = { hl_group = "ObsidianTag" },
      --   hl_groups = {
      --     ObsidianTodo = { bold = true, fg = "#f78c6c" },
      --     ObsidianDone = { bold = true, fg = "#89ddff" },
      --     ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      --     ObsidianTilde = { bold = true, fg = "#ff5370" },
      --     ObsidianBullet = { bold = true, fg = "#89ddff" },
      --     ObsidianRefText = { underline = true, fg = "#c792ea" },
      --     ObsidianExtLinkIcon = { fg = "#c792ea" },
      --     ObsidianTag = { italic = true, fg = "#89ddff" },
      --     ObsidianHighlightText = { bg = "#75662e" },
      --   },
      -- }
      opts.note_frontmatter_func = function(note)
        local frontmatter = {
          id = note.id,
          aliases = note.aliases,
          title = note.title,
          date = note.date,
          tags = note.tags,
        }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            frontmatter[k] = v
          end
        end
        return frontmatter
      end
    end,
  },
}
