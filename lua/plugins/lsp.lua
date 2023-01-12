local function attach_lsp_signature(bufnr)
  require("lsp_signature").on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    hint_enable = false, -- virtual hint enable
    hint_prefix = "📚 ",
    floating_window = true,
    floating_window_above_cur_line = true,
    -- floating_window_off_x = 1, -- adjust float windows x position.
    -- floating_window_off_y = 0,
  }, bufnr)
end

return {
  { "ray-x/lsp_signature.nvim" },

  -- lsp config
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(client, buffer)
          attach_lsp_signature(buffer)

        -- client.server_capabilities.document_formatting = false
        -- client.server_capabilities.document_range_formatting = false
          -- stylua: ignore
          Map("<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
          Map("<A-O>", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- servers will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,

        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "typescript-language-server",

        "prettierd",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "black",
      },
    },
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.black,
          nls.builtins.formatting.shfmt,

          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.shellcheck,
        },
      }
    end,
  },
}
