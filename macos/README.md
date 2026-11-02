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

## Window manager (AeroSpace: `aerospace.toml`)

xmonad's default keys and `xmonad.hs` settings, with Super as mod.
Workspaces work like xmonad's: one shared set 1–9, each monitor shows one,
and Super+N pulls workspace N onto the focused monitor (swapping it over if
the other monitor shows it). Everything lives on a single macOS Space, so
don't add Desktops in Mission Control.

| Keys | Action |
|------|--------|
| Super+J/K, Super+Tab / Shift+Tab | focus next / previous |
| Super+Shift+J/K | swap with next / previous |
| Super+Enter, Super+M | swap with / focus master |
| Super+H/L | shrink / expand |
| Super+Space, Super+Shift+Space | next layout (Tall → Mirror → Tabbed → Full), reset |
| Super+F | toggle Full and back |
| Super+T | sink / float |
| Super+1..9, Super+Shift+1..9 | go to / send to workspace |
| Super+W/E/R | focus screen 1–3 (left to right) |
| Super+Shift+H/L | send window to previous / next screen |
| Super+Shift+Enter, Super+Shift+C | terminal, close window |
| Super+N, Super+Q, Super+Shift+Q | refresh, reload config, log out |
| Alt+M | minimize |
| Super+↑ or Super+` | Mission Control |

App launch keys match `myKeys`; Super+Shift+S is a region screenshot to the
clipboard. Those, Super+P and log out live in Karabiner; layout keys AeroSpace
has no single command for go through `bin/xmonad-layout`.

Differences from xmonad: Tall puts windows side by side in equal columns
(AeroSpace has no master + stack area), so Super+, / . do nothing; Tabbed is
AeroSpace's accordion; Alt+Shift+M (restore minimized) isn't carried over.

## Linux → macOS

| Linux | macOS |
|-------|-------|
| xmonad + xmobar | AeroSpace + borders (native menu bar) |
| rofi | Spotlight on Super+P |
| setxkbmap caps:swapescape | Karabiner-Elements |
| ibus / mozc | built-in Japanese input |
| maim, i3lock-fancy | screencapture, Ctrl+Alt+L |
| notify-send, xclip, xdg-open, setsid | shims in `bin/` (osascript, pbcopy, open, nohup) |
| zathura, sxiv | shims in `bin/` that `open` the file (Preview) |
| GNU coreutils/sed/grep/find/awk | Homebrew gnubin, first in PATH (`.zprofile`) |
| nemo | Finder |
