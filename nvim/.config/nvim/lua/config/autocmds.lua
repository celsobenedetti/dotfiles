-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local all = vim.api.nvim_create_augroup("AllFilesGroup", { clear = true })
local markdown = vim.api.nvim_create_augroup("MarkdownGroup", { clear = true })
local typeScript = nil -- vim.api.nvim_create_augroup("TypeScriptGroup", { clear = true })
local json = vim.api.nvim_create_augroup("JSONGroup", { clear = true })

-- All files --------------------------------------------------------------

if all then
  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
      vim.cmd("setlocal formatoptions-=cro") -- Stop comment continuation on line below
      vim.cmd("hi SpellBad guifg=#d8dee9")
      -- vim.cmd("TSDisable highlight") -- Disable TreeSitter highlighting
    end,
    group = all,
    desc = "Run on all files",
  })
end
-- Markdown --------------------------------------------------------------

if markdown then
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*.md",
    callback = function()
      vim.cmd("set syntax=markdown")
      vim.cmd.colorscheme(Colorschemes.markdown)
    end,
    group = markdown,
    desc = "Run when entering Markdown files",
  })

  vim.api.nvim_create_autocmd({ "BufLeave" }, {
    pattern = "*.md",
    callback = function()
      vim.cmd.colorscheme(Colorschemes.default)
    end,
    group = markdown,
    desc = "Run when leaving Markdown files",
  })
end

-- TypeScript --------------------------------------------------------------

if typeScript then
  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = "*.ts",
    callback = function()
      vim.cmd("TSDisable highlight") -- Disable TreeSitter highlighting
    end,
    group = typeScript,
    desc = "Run when entering TypeScript files",
  })
end

-- JSON --------------------------------------------------------------

if json then
  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = "*.json",
    callback = function()
      -- disable conceal
      local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
      require("lazyvim.util").toggle("conceallevel", false, { 0, conceallevel })
    end,
    group = json,
    desc = "Run when entering JSON files",
  })
end
