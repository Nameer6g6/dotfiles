-- Same look and keys as .config/alacritty/alacritty.toml. WezTerm is here
-- for what Alacritty can't do: draw images (lf previews via sixel).
local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

-- Colors (Tokyo Night Storm, as in alacritty.toml)
config.colors = {
  background = "#24283b",
  foreground = "#c0caf5",
  ansi = { "#1D202F", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
  indexed = { [16] = "#ff9e64", [17] = "#db4b4b" },
}
config.bold_brightens_ansi_colors = true

-- Font
config.font = wezterm.font "FiraCode Nerd Font"
config.font_size = 14.0

-- Window: no title bar, no tabs (tmux does that), small padding
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_padding = { left = 2, right = 2, top = 2, bottom = 2 }
config.adjust_window_size_when_changing_font_size = false

-- Left Option = Meta like Linux Alt; right Option still types ü/é
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- Scrollback and selection (selecting copies to the clipboard by default)
config.scrollback_lines = 10000
config.selection_word_boundary = " \t\n,│`|:\"'()[]{}<>"

config.check_for_updates = false
config.audible_bell = "Disabled"

config.keys = {
  -- Shift+Enter sends Esc+Enter, as in Alacritty
  { key = "Enter", mods = "SHIFT", action = act.SendString "\x1b\r" },
  -- Alt+Enter is WezTerm's fullscreen toggle; leave it to the shell/nvim
  { key = "Enter", mods = "ALT", action = act.DisableDefaultAssignment },
  -- Ctrl font zoom like Linux
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "+", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },
  -- Ctrl+Shift+Space: copy mode, WezTerm's version of Alacritty's vi mode
  { key = "Space", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
}

return config
