local trouble = require("trouble.providers.telescope")

local function search_dotfiles()
  require("telescope.builtin").find_files({
    prompt_title = "< Dotfiles >",
    search_dirs = {
      "~/.dotfiles",
      "~/.config/nvim",
    },
    hidden = true,
    find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!old_nvim" },
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
  })
end

return {

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },

    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,

    opts = {
      defaults = {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", --  "ignore_case" | "respect_case" |"smart_case"
          },
        },
        file_ignore_patterns = { "node_modules", ".git/", "tmp", ".png", ".ico", ".jpg" },
        prompt_prefix = "  > ",
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<C-/>"] = "which_key",
            ["<C-C>"] = false,
            ["<C-[>"] = false,
            ["<c-t>"] = trouble.open_with_trouble,
          },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
        selection_caret = " ",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--hidden",
          "--smart-case",
        },
        pickers = {
          live_grep = { hidden = true },
          find_files = { hidden = true },
        },
      },
    },
    keys = {
      { "<leader>dot", search_dotfiles, desc = "Search Dotfiles" },
      { "<leader><leader>", require("telescope.builtin").buffers, desc = "Search Buffers" },
    },
  },
}
