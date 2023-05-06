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
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
              },
            },
          },
        },
        angularls = {},
        tailwindcss = { filetypes = { "vue", "javascriptreact", "typescriptreact", "html" } },
        emmet_ls = { filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "gohtml" } },
        -- zk = {},
      })

      opts.setup = {
        tsserver = function(_, ts_opts)
          require("typescript").setup({ server = ts_opts })
          return true
        end,
        -- HACK: Have not figured this out
        lua_ls = function(_, _)
          return true
        end,
        zk = function()
          require("zk").setup()
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
    dependencies = { "mason.nvim" },
    event = "BufReadPre",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettierd,
          -- nls.builtins.formatting.prettier,
          nls.builtins.formatting.black,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.gofumpt,
          nls.builtins.formatting.google_java_format.with({
            extra_args = { "--aosp" },
          }),
          -- nls.builtins.formatting.rustywind.with({
          nls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "tsql" }, -- change to your dialect
          }),
          --   filetypes = { "html", "javascriptreact", "typescriptreact", "vue" },
          -- }),

          -- nls.builtins.diagnostics.flake8.with({
          --   extra_args = { "--max-line-length", "160" },
          -- }),
          nls.builtins.diagnostics.ruff,
          nls.builtins.diagnostics.golangci_lint,
          nls.builtins.diagnostics.shellcheck,

          -- nls.builtins.diagnostics.alex.with({ filetypes = { "markdown" } }),
          nls.builtins.diagnostics.proselint.with({ filetypes = { "markdown" } }),
          nls.builtins.diagnostics.write_good.with({
            filetypes = { "markdown" },
            extra_args = {
              "--no-passive",
              "--no-tooWordy",
            },
          }),

          -- nls.builtins.completion.spell.with({ filetypes = { "markdown" } }),

          nls.builtins.code_actions.shellcheck,
          nls.builtins.code_actions.proselint.with({ filetypes = { "markdown" } }),
        },
      }
    end,
  },

  --zk
  {
    "mickael-menu/zk-nvim",
    ft = "markdown",
    config = function()
      Map("<leader>zn", ":ZkNewFromTitleSelection<CR>", { mode = { "v" } })
      Map("<leader>zn", ":ZkNewFromTitleSelection<CR>", { mode = { "v" } })
      Map("<leader>zz", ":ZkNotes<CR>", { mode = { "v", "n" } })
      Map("<leader>zb", ":ZkBacklinks<CR>", { mode = { "n", "v" } })
      Map("<leader>zl", ":ZkLinks<CR>", { mode = { "n", "v" } })
    end,
  },


}
