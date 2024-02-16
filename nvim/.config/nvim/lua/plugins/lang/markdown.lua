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
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "markdown",
        "markdown_inline",
      })
    end,
  },

  {
    "uga-rosa/cmp-dictionary",
    -- TODO: see if newer versions work
    commit = "d17bc1f87736b6a7f058b2f246e651d34d648b47",
    config = function()
      local dict = require("cmp_dictionary")
      dict.setup({
        -- The following are default values.
        exact = 2,
        first_case_insensitive = false,
        document = false,
        document_command = "wn %s -over",
        async = false,
        sqlite = false,
        max_items = -1,
        capacity = 5,
        debug = false,
      })
      -- dict.update()
      dict.switcher({
        spelllang = {
          en = "~/.dotfiles/english.dict",
        },
      })
    end,
    ft = { "markdown", "tex", "latex", "vimwiki", "gitcommit" },
    dependencies = {
      {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          local cmp = require("cmp")
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
            { name = "dictionary", keyword_length = 2 },
          }))
        end,
      },
    },
  },

  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
      "norg",
    },
    config = function()
      require("autolist").setup()

      vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
      vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
      -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
      vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
      vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
      vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
      vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
      vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

      -- cycle list types with dot-repeat
      vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
      vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

      -- if you don't want dot-repeat
      -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
      -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

      -- functions to recalculate list on edit
      vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
      vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
      vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
      vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
  },

  -- zk
  {
    "zk-org/zk-nvim",
    enabled = false,
    ft = "markdown",
    keys = {
      { "<leader>zn", ":ZkNewFromTitleSelection<CR>", mode = "v" },
      { "<leader>zn", ":ZkNewFromTitleSelection<CR>", mode = "v" },
      { "<leader>zz", ":ZkNotes<CR>" },
      { "<leader>zb", ":ZkBacklinks<CR>" },
      { "<leader>zl", ":ZkLinks<CR>" },
      { "<leader>zt", ":ZkTags<CR>" },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, { "zk" })
          end
        end,
      },
    },
  },

  {
    "epwalsh/obsidian.nvim",
    commit = "06154ec6f2964632d53c8fea9f0c175f31357192",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    keys = {
      { "<leader>zz", ":ObsidianSearch<CR>" },
      { "<leader>oo", ":ObsidianOpen<CR>" },
      { "<leader>ob", ":ObsidianBacklinks<CR>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
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
        local out = { id = note.id, aliases = note.aliases }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },
  },

  {
    "lukas-reineke/headlines.nvim",
    config = function()
      require("headlines").setup({
        markdown = {
          headline_highlights = { "DevIconEditorConfig" },
          codeblock_highlight = "None",
          dash_highlight = "None",
          dash_string = "",

          quote_highlight = "None",
          quote_string = ">",
          fat_headlines = true,
          fat_headline_upper_string = "",
          fat_headline_lower_string = "━",
        },
      })
    end,
  },
}
