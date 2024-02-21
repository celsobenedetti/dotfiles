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
      { "<leader>zk", ":ObsidianSearch<CR>" },
      { "<leader>notes", ":ObsidianSearch<CR>" },
      { "<leader>oo", ":ObsidianOpen<CR>" },
      { "<leader>zb", ":ObsidianBacklinks<CR>" },
      { "<leader>zl", ":ObsidianLinks<CR>" },
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
      opts.ui = {
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "x", hl_group = "ObsidianTilde" },
          ["x"] = { char = "✔", hl_group = "ObsidianDone" },
        },
      }
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
