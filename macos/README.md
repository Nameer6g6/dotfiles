# macOS, Linux-style

```sh
git clone git@github.com:Nameer6g6/dotfiles.git ~/dotfiles
~/dotfiles/macos/bootstrap.sh
```

## Keyboard (Karabiner: `karabiner/karabiner.json`)

| Linux key | PC keyboard | MacBook keyboard |
|-----------|-------------|------------------|
| Ctrl      | Ctrl        | fn (corner)      |
| Super     | Win         | ⌃ control        |
| Alt       | Alt         | ⌥ option, ⌘ command |
| Caps ↔ Esc | swapped    | swapped          |

- **Ctrl** works like Linux in apps (Ctrl+C/V/T/W/L/F/Z, Ctrl+Y redo,
  Ctrl+←/→ word jump, Ctrl+Backspace, Home/End, Ctrl+click new tab).
  In terminals it is a real Ctrl, and Ctrl+Shift+C/V copy and paste.
- **Super** is the tiling mod key (sent as ⌃⌥⌘, so it never hits app shortcuts).
- **Super+P** opens Spotlight (rofi). **Ctrl+Alt+L** locks the screen. **Ctrl+Space** switches input source.
- Right ⌘ is untouched, as an escape hatch for real ⌘ shortcuts.

## Window manager (AeroSpace: `aerospace.toml`)

Same keys as `xmonad.hs`, with Super as mod:
Super+1..9 / Super+Shift+1..9, Super+J/K focus, Super+Shift+J/K swap,
Super+H/L resize, Super+Space layout, Super+Shift+Space tabbed, Super+F full,
Super+T float, Super+Shift+Enter terminal, Super+Shift+C close, Super+Q reload,
Super+Shift+S screenshot to clipboard. App launch keys match `myKeys`.

## Linux → macOS

| Linux | macOS |
|-------|-------|
| xmonad + xmobar | AeroSpace + borders (native menu bar) |
| rofi | Spotlight on Super+P |
| setxkbmap caps:swapescape | Karabiner-Elements |
| ibus / mozc | built-in Japanese input |
| maim, i3lock-fancy | screencapture, Ctrl+Alt+L |
| notify-send, xclip | shims in `bin/` (osascript, pbcopy) |
| nemo | Finder |
