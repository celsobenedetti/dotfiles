return {
  search_dotfiles = function()
    require("telescope.builtin").find_files({
      prompt_title = "< Dotfiles >",
      search_dirs = {
        "~/.dotfiles",
        "~/.config/nvim",
      },
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
    })
  end,
}
