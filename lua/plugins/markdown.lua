return {
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
      Map("<leader>zt", ":ZkTags<CR>", { mode = { "n", "v" } })

      Map(
        "<C-t>",
        require("config.functions").toggle_checkbox,
        { desc = "Toggle to-do item checkbox", mode = { "i", "n" } }
      )
    end,
  },

  { "toppair/peek.nvim", build = "deno task --quiet build:fast" },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install", ft = "markdown" },

  {
    "jbyuki/venn.nvim",
    ft = "markdown",
    config = function()
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd([[setlocal ve=all]])
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "b", ":VBox<CR>", { noremap = true })
        else
          vim.cmd([[setlocal ve=]])
          vim.cmd([[mapclear <buffer>]])
          vim.b.venn_enabled = nil
        end
      end
      -- toggle keymappings for venn using <leader>v
      Map("<leader>v", ":lua Toggle_venn()<CR>", { desc = "Toggle venn" })
    end,
  },
}
