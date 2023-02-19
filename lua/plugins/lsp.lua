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
          Map("<leader>RF", ":TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
          Map("<A-O>", function()
            local ts = require("typescript")
            ts.actions.removeUnused()
            ts.actions.addMissingImports()
            -- ts.actions.organizeImports()
          end, { buffer = buffer, desc = "Organize Imports" })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.autoformat = false
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        -- servers will be automatically installed with mason and loaded with lspconfig
        sumneko_lua = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        pyright = {},
        cssls = {},
        gopls = {},
        dockerls = {},
        yamlls = {},
        angularls = {},
        tailwindcss = { filetypes = { "vue", "javascriptreact", "typescriptreact", "html" } },
        emmet_ls = { filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "gohtml" } },
        zk = {},
      })

      -- HACK: Have not figured this out
      opts.servers.lua_ls = nil

      opts.setup = {
        tsserver = function(_, ts_opts)
          require("typescript").setup({ server = ts_opts })
          return true
        end,
      }
    end,
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
        "pyright",
        "typescript-language-server",

        "prettierd",
        "black",
      })
    end,
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
          -- nls.builtins.formatting.rustywind.with({
          --   filetypes = { "html", "javascriptreact", "typescriptreact", "vue" },
          -- }),

          nls.builtins.diagnostics.flake8,
          -- nls.builtins.diagnostics.golangci_lint,
          nls.builtins.diagnostics.shellcheck,
        },
      }
    end,
  },

  --zk
  {
    "mickael-menu/zk-nvim",
    ft = "markdown",
    config = function()
      require("zk").setup()
    end,
  },
}
