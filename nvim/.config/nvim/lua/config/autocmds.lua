-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local work_week = require("functions.markdown.work_week")

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
  vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    pattern = "*.md",
    callback = function()
      work_week.find_today()
    end,
    group = markdown,
    desc = "Run when entering Markdown files",
  })

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*.md",
    callback = function()
      require("twilight").enable()
    end,
    group = markdown,
    desc = "Run when entering Markdown files",
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
      vim.o.conceallevel = 3
    end,
    group = json,
    desc = "Run when entering JSON files",
  })
end
