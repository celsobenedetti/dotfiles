# LazyVim

A starter template for [ ](https://github.com/LazyVim/LazyVim)

- ## Usages

### _Telescope_

| Keymap              | Action                                                               |
| ------------------- | -------------------------------------------------------------------- |
| `:Telescope macros` | Launch the Telescope extension using the `Telescope macros` command  |
| `yq`                | Yank the currently selected macro, in human readable format (normal) |
| `<cr>`              | Queue the currently selected macro (insert, normal)                  |
| `<c-d>`             | Delete the currently selected macro (insert)                         |
| `d`                 | Delete the currently selected macro                                  |

## todo-comments.nvim

```lua
-- FIX: = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
-- TODO:  = { icon = " ", color = "info" },
-- HACK:  = { icon = " ", color = "warning" },
-- WARN:  = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
-- PERF:  = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
-- NOTE:  = { icon = " ", color = "hint", alt = { "INFO" } },
-- TEST:  = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
```
