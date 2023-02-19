-- are we currently in a neorg file?
local is_neorg = false

-- go to default index, or return to original context
local function toggle_default_index()
  local index_file = vim.fn.getcwd() .. "/index.norg"
  local is_neorg_workspace = vim.fn.filereadable(index_file) ~= 0

  if is_neorg then
    vim.cmd("Neorg return")
  elseif is_neorg_workspace then
    vim.cmd("Neorg index")
  else
    vim.cmd("Neorg workspace notes")
  end

  is_neorg = not is_neorg
end

return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.export"] = {}, -- Export to different filetypes
      ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
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
  cmd = { "Neorg" },
  -- event = "VeryLazy",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  keys = {
    { "<leader>o", toggle_default_index, desc = "Default workspace index Neorg" },
  },
}
