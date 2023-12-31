# ⌨️ Keymaps

**LazyVim** uses [which-key.nvim](https://github.com/folke/which-key.nvim) to help you remember your
keymaps. Just press any key like `<space>` and you'll see a popup with all
possible keymaps starting with `<space>`.

![image](https://user-images.githubusercontent.com/292349/211862473-1ff5ee7a-3bb9-4782-a9f6-014f0e5d4474.png)

- default `<leader>` is `<space>`
- default `<localleader>` is `\`

<!-- keymaps:start -->

## General

| Key                  | Description                           | Mode                       |
| -------------------- | ------------------------------------- | -------------------------- |
| `<C-h>`              | Go to left window                     | **n**, **t**               |
| `<C-j>`              | Go to lower window                    | **n**, **t**               |
| `<C-k>`              | Go to upper window                    | **n**, **t**               |
| `<C-l>`              | Go to right window                    | **n**, **t**               |
| `<C-Up>`             | Increase window height                | **n**                      |
| `<C-Down>`           | Decrease window height                | **n**                      |
| `<C-Left>`           | Decrease window width                 | **n**                      |
| `<C-Right>`          | Increase window width                 | **n**                      |
| `<A-j>`              | Move down                             | **n**, **i**, **v**        |
| `<A-k>`              | Move up                               | **n**, **i**, **v**        |
| `<S-h>`              | Prev buffer                           | **n**                      |
| `<S-l>`              | Next buffer                           | **n**                      |
| `[b`                 | Prev buffer                           | **n**                      |
| `]b`                 | Next buffer                           | **n**                      |
| `<leader>bb`         | Switch to Other Buffer                | **n**                      |
| `<leader>``          | Switch to Other Buffer                | **n**                      |
| `<esc>`              | Escape and clear hlsearch             | **i**, **n**               |
| `<leader>ur`         | Redraw / clear hlsearch / diff update | **n**                      |
| `gw`                 | Search word under cursor              | **n**, **x**               |
| `n`                  | Next search result                    | **n**, **x**, **o**        |
| `N`                  | Prev search result                    | **n**, **x**, **o**        |
| `<C-s>`              | Save file                             | **i**, **v**, **n**, **s** |
| `<leader>K`          | Keywordprg                            | **n**                      |
| `<leader>l`          | Lazy                                  | **n**                      |
| `<leader>fn`         | New File                              | **n**                      |
| `<leader>xl`         | Location List                         | **n**                      |
| `<leader>xq`         | Quickfix List                         | **n**                      |
| `<leader>uf`         | Toggle format on Save                 | **n**                      |
| `<leader>us`         | Toggle Spelling                       | **n**                      |
| `<leader>uw`         | Toggle Word Wrap                      | **n**                      |
| `<leader>ul`         | Toggle Line Numbers                   | **n**                      |
| `<leader>ud`         | Toggle Diagnostics                    | **n**                      |
| `<leader>uc`         | Toggle Conceal                        | **n**                      |
| `<leader>uh`         | Toggle Inlay Hints                    | **n**                      |
| `<leader>gg`         | Lazygit (root dir)                    | **n**                      |
| `<leader>gG`         | Lazygit (cwd)                         | **n**                      |
| `<leader>qq`         | Quit all                              | **n**                      |
| `<leader>ui`         | Inspect Pos                           | **n**                      |
| `<leader>L`          | LazyVim Changelog                     | **n**                      |
| `<leader>ft`         | Terminal (root dir)                   | **n**                      |
| `<leader>fT`         | Terminal (cwd)                        | **n**                      |
| `<c-/>`              | Terminal (root dir)                   | **n**                      |
| `<c-_>`              | which_key_ignore                      | **n**, **t**               |
| `<esc><esc>`         | Enter Normal Mode                     | **t**                      |
| `<C-/>`              | Hide Terminal                         | **t**                      |
| `<leader>ww`         | Other window                          | **n**                      |
| `<leader>wd`         | Delete window                         | **n**                      |
| `<leader>w-`         | Split window below                    | **n**                      |
| `<leader>w&vert;`    | Split window right                    | **n**                      |
| `<leader>-`          | Split window below                    | **n**                      |
| `<leader>&vert;`     | Split window right                    | **n**                      |
| `<leader><tab>l`     | Last Tab                              | **n**                      |
| `<leader><tab>f`     | First Tab                             | **n**                      |
| `<leader><tab><tab>` | New Tab                               | **n**                      |
| `<leader><tab>]`     | Next Tab                              | **n**                      |
| `<leader><tab>d`     | Close Tab                             | **n**                      |
| `<leader><tab>[`     | Previous Tab                          | **n**                      |

## LSP

| Key          | Description            | Mode         |
| ------------ | ---------------------- | ------------ |
| `<leader>cd` | Line Diagnostics       | **n**        |
| `<leader>cl` | Lsp Info               | **n**        |
| `gd`         | Goto Definition        | **n**        |
| `gr`         | References             | **n**        |
| `gD`         | Goto Declaration       | **n**        |
| `gI`         | Goto Implementation    | **n**        |
| `gy`         | Goto T[y]pe Definition | **n**        |
| `K`          | Hover                  | **n**        |
| `gK`         | Signature Help         | **n**        |
| `<c-k>`      | Signature Help         | **i**        |
| `]d`         | Next Diagnostic        | **n**        |
| `[d`         | Prev Diagnostic        | **n**        |
| `]e`         | Next Error             | **n**        |
| `[e`         | Prev Error             | **n**        |
| `]w`         | Next Warning           | **n**        |
| `[w`         | Prev Warning           | **n**        |
| `<leader>cf` | Format Document        | **n**        |
| `<leader>cf` | Format Range           | **v**        |
| `<leader>ca` | Code Action            | **n**, **v** |
| `<leader>cA` | Source Action          | **n**        |
| `<leader>cr` | Rename                 | **n**        |

## [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git)

| Key          | Description               | Mode  |
| ------------ | ------------------------- | ----- |
| `<leader>bp` | Toggle pin                | **n** |
| `<leader>bP` | Delete non-pinned buffers | **n** |

## [flash.nvim](https://github.com/folke/flash.nvim.git)

| Key     | Description         | Mode                |
| ------- | ------------------- | ------------------- |
| `s`     | Flash               | **n**, **x**, **o** |
| `S`     | Flash Treesitter    | **n**, **o**, **x** |
| `r`     | Remote Flash        | **o**               |
| `R`     | Treesitter Search   | **o**, **x**        |
| `<c-s>` | Toggle Flash Search | **c**               |

## [mason.nvim](https://github.com/williamboman/mason.nvim.git)

| Key          | Description | Mode  |
| ------------ | ----------- | ----- |
| `<leader>cm` | Mason       | **n** |

## [mini.bufremove](https://github.com/echasnovski/mini.bufremove.git)

| Key          | Description           | Mode  |
| ------------ | --------------------- | ----- |
| `<leader>bd` | Delete Buffer         | **n** |
| `<leader>bD` | Delete Buffer (Force) | **n** |

## [mini.surround](https://github.com/echasnovski/mini.surround.git)

| Key   | Description                          | Mode         |
| ----- | ------------------------------------ | ------------ |
| `gza` | Add surrounding                      | **n**, **v** |
| `gzd` | Delete surrounding                   | **n**        |
| `gzf` | Find right surrounding               | **n**        |
| `gzF` | Find left surrounding                | **n**        |
| `gzh` | Highlight surrounding                | **n**        |
| `gzr` | Replace surrounding                  | **n**        |
| `gzn` | Update `MiniSurround.config.n_lines` | **n**        |

## [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim.git)

| Key          | Description                 | Mode  |
| ------------ | --------------------------- | ----- |
| `<leader>fe` | Explorer NeoTree (root dir) | **n** |
| `<leader>fE` | Explorer NeoTree (cwd)      | **n** |
| `<leader>e`  | Explorer NeoTree (root dir) | **n** |
| `<leader>E`  | Explorer NeoTree (cwd)      | **n** |

## [noice.nvim](https://github.com/folke/noice.nvim.git)

| Key           | Description        | Mode                |
| ------------- | ------------------ | ------------------- |
| `<S-Enter>`   | Redirect Cmdline   | **c**               |
| `<leader>snl` | Noice Last Message | **n**               |
| `<leader>snh` | Noice History      | **n**               |
| `<leader>sna` | Noice All          | **n**               |
| `<leader>snd` | Dismiss All        | **n**               |
| `<c-f>`       | Scroll forward     | **i**, **n**, **s** |
| `<c-b>`       | Scroll backward    | **i**, **n**, **s** |

## [nvim-notify](https://github.com/rcarriga/nvim-notify.git)

| Key          | Description               | Mode  |
| ------------ | ------------------------- | ----- |
| `<leader>un` | Dismiss all Notifications | **n** |

## [nvim-spectre](https://github.com/nvim-pack/nvim-spectre.git)

| Key          | Description                | Mode  |
| ------------ | -------------------------- | ----- |
| `<leader>sr` | Replace in files (Spectre) | **n** |

## [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)

| Key         | Description         | Mode  |
| ----------- | ------------------- | ----- |
| `<c-space>` | Increment selection | **n** |
| `<bs>`      | Decrement selection | **x** |

## [persistence.nvim](https://github.com/folke/persistence.nvim.git)

| Key          | Description                | Mode  |
| ------------ | -------------------------- | ----- |
| `<leader>qs` | Restore Session            | **n** |
| `<leader>ql` | Restore Last Session       | **n** |
| `<leader>qd` | Don't Save Current Session | **n** |

## [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)

| Key               | Description              | Mode  |
| ----------------- | ------------------------ | ----- |
| `<leader>,`       | Switch Buffer            | **n** |
| `<leader>/`       | Grep (root dir)          | **n** |
| `<leader>:`       | Command History          | **n** |
| `<leader><space>` | Find Files (root dir)    | **n** |
| `<leader>fb`      | Buffers                  | **n** |
| `<leader>ff`      | Find Files (root dir)    | **n** |
| `<leader>fF`      | Find Files (cwd)         | **n** |
| `<leader>fr`      | Recent                   | **n** |
| `<leader>fR`      | Recent (cwd)             | **n** |
| `<leader>gc`      | commits                  | **n** |
| `<leader>gs`      | status                   | **n** |
| `<leader>s"`      | Registers                | **n** |
| `<leader>sa`      | Auto Commands            | **n** |
| `<leader>sb`      | Buffer                   | **n** |
| `<leader>sc`      | Command History          | **n** |
| `<leader>sC`      | Commands                 | **n** |
| `<leader>sd`      | Document diagnostics     | **n** |
| `<leader>sD`      | Workspace diagnostics    | **n** |
| `<leader>sg`      | Grep (root dir)          | **n** |
| `<leader>sG`      | Grep (cwd)               | **n** |
| `<leader>sh`      | Help Pages               | **n** |
| `<leader>sH`      | Search Highlight Groups  | **n** |
| `<leader>sk`      | Key Maps                 | **n** |
| `<leader>sM`      | Man Pages                | **n** |
| `<leader>sm`      | Jump to Mark             | **n** |
| `<leader>so`      | Options                  | **n** |
| `<leader>sR`      | Resume                   | **n** |
| `<leader>sw`      | Word (root dir)          | **n** |
| `<leader>sW`      | Word (cwd)               | **n** |
| `<leader>sw`      | Selection (root dir)     | **v** |
| `<leader>sW`      | Selection (cwd)          | **v** |
| `<leader>uC`      | Colorscheme with preview | **n** |
| `<leader>ss`      | Goto Symbol              | **n** |
| `<leader>sS`      | Goto Symbol (Workspace)  | **n** |

## [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git)

```lua
-- FIX: = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
-- TODO:  = { icon = " ", color = "info" },
-- HACK:  = { icon = " ", color = "warning" },
-- WARN:  = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
-- PERF:  = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
-- NOTE:  = { icon = " ", color = "hint", alt = { "INFO" } },
-- TEST:  = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
```

| Key          | Description              | Mode  |
| ------------ | ------------------------ | ----- |
| `]t`         | Next todo comment        | **n** |
| `[t`         | Previous todo comment    | **n** |
| `<leader>xt` | Todo (Trouble)           | **n** |
| `<leader>xT` | Todo/Fix/Fixme (Trouble) | **n** |
| `<leader>st` | Todo                     | **n** |
| `<leader>sT` | Todo/Fix/Fixme           | **n** |

## [trouble.nvim](https://github.com/folke/trouble.nvim.git)

| Key          | Description                     | Mode  |
| ------------ | ------------------------------- | ----- |
| `<leader>xx` | Document Diagnostics (Trouble)  | **n** |
| `<leader>xX` | Workspace Diagnostics (Trouble) | **n** |
| `<leader>xL` | Location List (Trouble)         | **n** |
| `<leader>xQ` | Quickfix List (Trouble)         | **n** |
| `[q`         | Previous trouble/quickfix item  | **n** |
| `]q`         | Next trouble/quickfix item      | **n** |

## [vim-illuminate](https://github.com/RRethy/vim-illuminate.git)

| Key  | Description    | Mode  |
| ---- | -------------- | ----- |
| `]]` | Next Reference | **n** |
| `[[` | Prev Reference | **n** |

## [yanky.nvim](https://github.com/gbprod/yanky.nvim.git)

Part of [lazyvim.plugins.extras.coding.yanky](/extras/coding/yanky)

| Key         | Description                           | Mode         |
| ----------- | ------------------------------------- | ------------ |
| `<leader>p` | Open Yank History                     | **n**        |
| `y`         | Yank text                             | **n**, **x** |
| `p`         | Put yanked text after cursor          | **n**, **x** |
| `P`         | Put yanked text before cursor         | **n**, **x** |
| `gp`        | Put yanked text after selection       | **n**, **x** |
| `gP`        | Put yanked text before selection      | **n**, **x** |
| `[y`        | Cycle forward through yank history    | **n**        |
| `]y`        | Cycle backward through yank history   | **n**        |
| `]p`        | Put indented after cursor (linewise)  | **n**        |
| `[p`        | Put indented before cursor (linewise) | **n**        |
| `]P`        | Put indented after cursor (linewise)  | **n**        |
| `[P`        | Put indented before cursor (linewise) | **n**        |
| `>p`        | Put and indent right                  | **n**        |
| `<p`        | Put and indent left                   | **n**        |
| `>P`        | Put before and indent right           | **n**        |
| `<P`        | Put before and indent left            | **n**        |
| `=p`        | Put after applying a filter           | **n**        |
| `=P`        | Put before applying a filter          | **n**        |

## [nvim-dap](https://github.com/mfussenegger/nvim-dap.git)

Part of [lazyvim.plugins.extras.dap.core](/extras/dap/core)

| Key          | Description             | Mode  |
| ------------ | ----------------------- | ----- |
| `<leader>dB` | Breakpoint Condition    | **n** |
| `<leader>db` | Toggle Breakpoint       | **n** |
| `<leader>dc` | Continue                | **n** |
| `<leader>dC` | Run to Cursor           | **n** |
| `<leader>dg` | Go to line (no execute) | **n** |
| `<leader>di` | Step Into               | **n** |
| `<leader>dj` | Down                    | **n** |
| `<leader>dk` | Up                      | **n** |
| `<leader>dl` | Run Last                | **n** |
| `<leader>do` | Step Out                | **n** |
| `<leader>dO` | Step Over               | **n** |
| `<leader>dp` | Pause                   | **n** |
| `<leader>dr` | Toggle REPL             | **n** |
| `<leader>ds` | Session                 | **n** |
| `<leader>dt` | Terminate               | **n** |
| `<leader>dw` | Widgets                 | **n** |

## [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui.git)

Part of [lazyvim.plugins.extras.dap.core](/extras/dap/core)

| Key          | Description | Mode         |
| ------------ | ----------- | ------------ |
| `<leader>du` | Dap UI      | **n**        |
| `<leader>de` | Eval        | **n**, **v** |

## [one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind.git)

Part of [lazyvim.plugins.extras.dap.nlua](/extras/dap/nlua)

| Key           | Description        | Mode  |
| ------------- | ------------------ | ----- |
| `<leader>daL` | Adapter Lua Server | **n** |
| `<leader>dal` | Adapter Lua        | **n** |

## [flit.nvim](https://github.com/ggandor/flit.nvim.git)

Part of [lazyvim.plugins.extras.editor.leap](/extras/editor/leap)

| Key | Description | Mode                |
| --- | ----------- | ------------------- |
| `f` | f           | **n**, **x**, **o** |
| `F` | F           | **n**, **x**, **o** |
| `t` | t           | **n**, **x**, **o** |
| `T` | T           | **n**, **x**, **o** |

## [leap.nvim](https://github.com/ggandor/leap.nvim.git)

Part of [lazyvim.plugins.extras.editor.leap](/extras/editor/leap)

| Key  | Description       | Mode                |
| ---- | ----------------- | ------------------- |
| `s`  | Leap forward to   | **n**, **x**, **o** |
| `S`  | Leap backward to  | **n**, **x**, **o** |
| `gs` | Leap from windows | **n**, **x**, **o** |

## [mini.files](https://github.com/echasnovski/mini.files.git)

Part of [lazyvim.plugins.extras.editor.mini-files](/extras/editor/mini-files)

| Key          | Description                                 | Mode  |
| ------------ | ------------------------------------------- | ----- |
| `<leader>fm` | Open mini.files (directory of current file) | **n** |
| `<leader>fM` | Open mini.files (cwd)                       | **n** |

## [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python.git)

Part of [lazyvim.plugins.extras.lang.python](/extras/lang/python)

| Key           | Description  | Mode  |
| ------------- | ------------ | ----- |
| `<leader>dPt` | Debug Method | **n** |
| `<leader>dPc` | Debug Class  | **n** |

## [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim.git)

Part of [lazyvim.plugins.extras.lang.python](/extras/lang/python)

| Key          | Description       | Mode  |
| ------------ | ----------------- | ----- |
| `<leader>cv` | Select VirtualEnv | **n** |

## [neotest](https://github.com/nvim-neotest/neotest.git)

Part of [lazyvim.plugins.extras.test.core](/extras/test/core)

| Key          | Description         | Mode  |
| ------------ | ------------------- | ----- |
| `<leader>tt` | Run File            | **n** |
| `<leader>tT` | Run All Test Files  | **n** |
| `<leader>tr` | Run Nearest         | **n** |
| `<leader>ts` | Toggle Summary      | **n** |
| `<leader>to` | Show Output         | **n** |
| `<leader>tO` | Toggle Output Panel | **n** |
| `<leader>tS` | Stop                | **n** |

## [nvim-dap](https://github.com/mfussenegger/nvim-dap.git)

Part of [lazyvim.plugins.extras.test.core](/extras/test/core)

| Key          | Description   | Mode  |
| ------------ | ------------- | ----- |
| `<leader>td` | Debug Nearest | **n** |

## [edgy.nvim](https://github.com/folke/edgy.nvim.git)

Part of [lazyvim.plugins.extras.ui.edgy](/extras/ui/edgy)

| Key          | Description        | Mode  |
| ------------ | ------------------ | ----- |
| `<leader>ue` | Edgy Toggle        | **n** |
| `<leader>uE` | Edgy Select Window | **n** |

## [project.nvim](https://github.com/ahmedkhalf/project.nvim.git)

Part of [lazyvim.plugins.extras.util.project](/extras/util/project)

| Key          | Description | Mode  |
| ------------ | ----------- | ----- |
| `<leader>fp` | Projects    | **n** |
