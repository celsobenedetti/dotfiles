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

  -- zk
  {
    "mickael-menu/zk-nvim",
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
    "uga-rosa/cmp-dictionary",
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
    ft = { "markdown", "tex", "latex", "vimwiki" },
    dependencies = {
      {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          local cmp = require("cmp")
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
            { name = "dictionary", keyword_length = 2 },
          }))
        end,
        ft = { "markdown", "tex", "latex", "vimwiki" },
      },
    },
  },
}
