local function random_letter_or_number()
  local is_number = math.random(0, 1) == 1
  if is_number then
    return string.char(math.random(48, 57))
  else
    return string.char(math.random(65, 90))
  end
end

return {
  {
    "epwalsh/obsidian.nvim",
    commit = "06154ec6f2964632d53c8fea9f0c175f31357192",
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
    config = function()
      require("obsidian").setup({
        new_notes_location = "notes_subdir",
        workspaces = {
          {
            name = "notes",
            path = "~/Documents/notes",
            overrides = {
              notes_subdir = "0-inbox",
            },
          },
        },
        ui = {
          checkboxes = {
            -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "x", hl_group = "ObsidianTilde" },
            ["-"] = { char = "x", hl_group = "ObsidianTilde" },
            -- Replace the above with this if you don't have a patched font:
            -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
            ["x"] = { char = "✔", hl_group = "ObsidianDone" },

            -- You can also add more custom ones...
          },
          reference_text = { hl_group = "ObsidianRefText" },
          highlight_text = { hl_group = "ObsidianHighlightText" },
          tags = { hl_group = "ObsidianTag" },
          hl_groups = {
            -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
            ObsidianTodo = { bold = true, fg = "#f78c6c" },
            ObsidianDone = { bold = true, fg = "#89ddff" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" },
            ObsidianBullet = { bold = true, fg = "#89ddff" },
            ObsidianRefText = { underline = true, fg = "#c792ea" },
            ObsidianExtLinkIcon = { fg = "#c792ea" },
            ObsidianTag = { italic = true, fg = "#89ddff" },
            ObsidianHighlightText = { bg = "#75662e" },
          },
        },

        note_id_func = function(title)
          if title ~= nil then
            title = title:gsub(" ", "-")
            title = string.lower(title)
          end
          local prefix = ""
          for _ = 1, 4 do
            prefix = prefix .. random_letter_or_number()
          end

          return prefix .. "_" .. title
        end,
        note_frontmatter_func = function(note)
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
        end,
      })
    end,
  },
}
