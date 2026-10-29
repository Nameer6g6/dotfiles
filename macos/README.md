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
- Keychron Q1 Max: keep its switch on **Mac** (media keys on the F row).
  Mac mode swaps Alt/Win in hardware, so Karabiner swaps ⌘/⌥ back for it.

## Window manager (Amethyst: `amethyst.yml`)

xmonad's default keys and `xmonad.hs` settings, with Super as mod:

| Keys | Action |
|------|--------|
| Super+J/K, Super+Tab / Shift+Tab | focus next / previous |
| Super+Shift+J/K | swap with next / previous |
| Super+Enter, Super+M | swap with / focus master |
| Super+H/L, Super+, / . | shrink / expand master, more / fewer in master |
| Super+Space, Super+Shift+Space | next layout (Tall → Mirror → Full), reset |
| Super+F | toggle Full and back |
| Super+T | sink / float |
| Super+1..9, Super+Shift+1..9 | go to / send to workspace (macOS Desktop) |
| Super+W/E/R | focus screen 1–3 (left to right) |
| Super+Shift+H/L | send window to previous / next screen |
| Super+Shift+Enter, Super+Shift+C | terminal, close window |
| Super+N, Super+Q, Super+Shift+Q | refresh, restart Amethyst, log out |
| Alt+M | minimize |
| Super+↑ or Super+` | Mission Control (add Desktops with + at the top) |

App launch keys match `myKeys`; Super+Shift+S is a region screenshot to the
clipboard. Keys Amethyst can't do itself live in Karabiner, and Super+1..9 are
macOS "Switch to Desktop N" shortcuts set by `bootstrap.sh`. Workspaces are
macOS Desktops, so there need to be 9 of them in Mission Control.

Not carried over: the tabbed layout, Alt+Shift+M (restore minimized) and
pinning apps to workspaces (use Dock > Options > Assign To instead).

## Linux → macOS

| Linux | macOS |
|-------|-------|
| xmonad + xmobar | Amethyst + borders (native menu bar) |
| rofi | Spotlight on Super+P |
| setxkbmap caps:swapescape | Karabiner-Elements |
| ibus / mozc | built-in Japanese input |
| maim, i3lock-fancy | screencapture, Ctrl+Alt+L |
| notify-send, xclip, xdg-open, setsid | shims in `bin/` (osascript, pbcopy, open, nohup) |
| zathura, sxiv | shims in `bin/` that `open` the file (Preview) |
| GNU coreutils/sed/grep/find/awk | Homebrew gnubin, first in PATH (`.zprofile`) |
| nemo | Finder |
