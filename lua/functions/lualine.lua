local sources = require("null-ls.sources")

local active_clients_count = 0
local client_list = ""

local function get_lsp_client_list()
  local err_msg = ""
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local lsp_clients = vim.lsp.get_active_clients()

  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  local null_ls_clients = sources.get_available(filetype)

  if next(lsp_clients) == nil then
    return err_msg
  end

  local client_count = 0
  for _ in pairs(lsp_clients) do
    client_count = client_count + 1
  end

  for _ in pairs(null_ls_clients) do
    client_count = client_count + 1
  end

  if client_count == active_clients_count then
    return client_list
  end

  active_clients_count = client_count

  local server_list = ""
  for _, client in ipairs(lsp_clients) do
    --get lsp clients names
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
      server_list = server_list .. ", " .. client.name
    end
  end

  --get null-ls sources names for current buffer
  for _, source in ipairs(null_ls_clients) do
    server_list = server_list .. ", " .. source.name
  end

  client_list = " " .. server_list:sub(2)

  if server_list ~= "" then
    return client_list
  else
    return err_msg
  end
end

return {
  get_lsp_client_list = get_lsp_client_list,
}
