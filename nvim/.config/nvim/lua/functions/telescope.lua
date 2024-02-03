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
}
