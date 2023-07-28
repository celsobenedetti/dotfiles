return function()
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