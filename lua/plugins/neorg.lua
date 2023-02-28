-- are we currently in neorg in project workspac?
local is_in_neorg_project = false
-- are we currently in a neorg default workspace?
local is_in_neorg_default = false

local neorg_default = "Neorg workspace notes"

-- go to default index, or return to original context
local function toggle_neorg_project()
  is_in_neorg_project = not is_in_neorg_project
  if not is_in_neorg_project then
    vim.cmd("Neorg return")
    return
  end

  local index_file = vim.fn.getcwd() .. "/index.norg"
  local is_neorg_workspace = vim.fn.filereadable(index_file) ~= 0

  if is_neorg_workspace then
    vim.cmd("Neorg index")
  else
    vim.cmd(neorg_default)
  end
end

-- go to default index, or go back
local function toggle_neorg()
  is_in_neorg_default = not is_in_neorg_default
  if not is_in_neorg_default then
    vim.cmd("Neorg return")
    return
  end

  vim.cmd(neorg_default)
end

return {
  {

    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.export"] = {}, -- Export to different filetypes
        ["core.norg.concealer"] = {
          config = {
            folds = false,
          },
        }, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/notes",
              -- go_microsservices = "~/projects/go-microservices",
            },
            -- default_workspace = "notes",
          },
        },
      },
    },
    ft = "norg",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
      { "<leader>o", toggle_neorg_project, desc = "Neorg: Go to project or default index" },
      { "<leader>I", toggle_neorg, desc = "Neorg: Go to default index" },
    },
  },
}
