# LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim)

## Usages

### NeoComposer

| Function            | Keymap  | Action                                                                                                              |
| ------------------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| `play_macro`        | `Q`     | Plays queued macro                                                                                                  |
| `stop_macro`        | `cq`    | Halts macro playback                                                                                                |
| `toggle_macro_menu` | `<m-q>` | Toggles popup macro menu                                                                                            |
| `cycle_next`        | `<c-n>` | Cycles available macros forward                                                                                     |
| `cycle_prev`        | `<c-p>` | Cycles available macros backward                                                                                    |
| `toggle_record`     | `q`     | Starts recording, press again to end recording                                                                      |
| `yank_macro`        | `yq`    | Yank the currently selected macro, in human readable format into the default register                               |
|                     |         |                                                                                                                     |
| `:ToggleDelay `     |         | For complex macros over large counts, you can toggle a delay between macro playback using the `ToggleDelay` command |

- _Telescope_
  | Keymap | Action |
  | ------------------- | -------------------------------------------------------------------- |
  | `:Telescope macros` | Launch the Telescope extension using the `Telescope macros` command |
  | `yq` | Yank the currently selected macro, in human readable format (normal) |
  | `<cr>` | Queue the currently selected macro (insert, normal) |
  | `<c-d>` | Delete the currently selected macro (insert) |
  | `d` | Delete the currently selected macro |
