#!/bin/sh
# Set up a Mac to feel like the Arch/xmonad machine.
# Safe to re-run: existing files are moved aside, correct links are left alone.
#
#   git clone git@github.com:Nameer6g6/dotfiles.git ~/dotfiles
#   ~/dotfiles/macos/bootstrap.sh
set -eu

[ "$(uname)" = Darwin ] || { echo "This script is for macOS." >&2; exit 1; }

repo=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

step() { printf '\n==> %s\n' "$*"; }

link() {
  src=$1 dest=$2
  if [ -L "$dest" ] && [ "$(readlink -- "$dest")" = "$src" ]; then
    printf 'ok: %s\n' "$dest"
    return
  fi
  mkdir -p -- "$(dirname -- "$dest")"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    backup=$dest.backup.$(date +%Y%m%d%H%M%S)
    printf 'backup: %s -> %s\n' "$dest" "$backup"
    mv -- "$dest" "$backup"
  fi
  printf 'link: %s -> %s\n' "$dest" "$src"
  ln -s -- "$src" "$dest"
}

step "Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
# Homebrew ignores third-party taps until trusted; trust only what we use
for tap in felixkratz/formulae hashicorp/tap; do
  brew tap "$tap"
done
if brew help trust >/dev/null 2>&1; then
  brew trust --formula felixkratz/formulae/borders
  brew trust --formula hashicorp/tap/terraform
fi
# coreutils ships its own `gfold` and refuses to install while the gfold
# git tool is linked (the Brewfile keeps it unlinked; aliasrc aliases it)
if brew list --formula gfold >/dev/null 2>&1; then
  brew unlink gfold >/dev/null
fi
brew bundle --file="$repo/macos/Brewfile"

step "Alacritty"
# Homebrew disabled the cask (not notarized), so install the release DMG
alacritty_version=0.17.0
if [ ! -d /Applications/Alacritty.app ]; then
  tmp=$(mktemp -d)
  curl -fL -o "$tmp/Alacritty.dmg" \
    "https://github.com/alacritty/alacritty/releases/download/v$alacritty_version/Alacritty-v$alacritty_version.dmg"
  mnt=$(hdiutil attach -nobrowse -readonly "$tmp/Alacritty.dmg" | awk -F'\t' '/\/Volumes\//{print $NF}')
  cp -R "$mnt/Alacritty.app" /Applications/
  hdiutil detach -quiet "$mnt"
  rm -rf "$tmp"
  # Unsigned app: let it open without the Gatekeeper prompt
  xattr -dr com.apple.quarantine /Applications/Alacritty.app 2>/dev/null || true
fi

step "Linking dotfiles"
for f in .zprofile .zshenv .tmux.conf .inputrc .ghci .haskeline; do
  link "$repo/$f" "$HOME/$f"
done
# Only what is useful on macOS; .local/share is deliberately not linked so
# work-laptop app data doesn't end up in the dotfiles repo.
for f in zsh aliasrc nvim alacritty lf git ctags flake8 gfold.toml stylua.toml; do
  [ -e "$repo/.config/$f" ] && link "$repo/.config/$f" "$HOME/.config/$f"
done
link "$repo/.local/bin" "$HOME/.local/bin"
link "$repo/macos/amethyst.yml" "$HOME/.config/amethyst/amethyst.yml"
link "$repo/macos/bordersrc" "$HOME/.config/borders/bordersrc"
link "$repo/macos/alacritty-local.toml" "$HOME/.config/alacritty-local.toml"
# Link the directory, not karabiner.json: Karabiner rewrites the file in place
link "$repo/macos/karabiner" "$HOME/.config/karabiner"
mkdir -p "$HOME/.cache/zsh"

step "tmux plugin manager"
[ -d "$HOME/.tmux/plugins/tpm" ] ||
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

step "macOS defaults"
# Fast key repeat for vim; holding a key repeats instead of showing the accent
# popup (Option dead keys still give ü/é/ñ)
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g ApplePressAndHoldEnabled -bool false
# Ctrl+Cmd+drag anywhere in a window moves it, like xmonad's mod+drag
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write com.apple.dock autohide -bool true
# Spaces are the xmonad workspaces: keep them in order 1-9
defaults write com.apple.dock mru-spaces -bool false
# Finder: hidden files, full paths, no .DS_Store on network drives
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
killall Dock Finder 2>/dev/null || true
# AltTab on Alt+Tab (Karabiner sends Alt as Option)
defaults write com.lwouis.alt-tab-macos holdShortcut -string "⌥"
defaults write com.lwouis.alt-tab-macos nextWindowShortcut -string "⇥"

step "Workspace keys"
# Super+1..9 (sent by Karabiner as ctrl+option+cmd+N) switches to Desktop N,
# like xmonad mod-N. Amethyst does Super+Shift+N (send window to Desktop N).
# Symbolic hotkeys 118-126 are "Switch to Desktop 1-9".
super_mask=1835008  # control + option + command
set -- 18 19 20 21 23 22 26 28 25  # key codes for 1-9
n=1
for keycode do
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add $((117 + n)) \
    "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>$((48 + n))</integer><integer>$keycode</integer><integer>$super_mask</integer></array><key>type</key><string>standard</string></dict></dict>"
  n=$((n + 1))
done
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true

step "Starting Karabiner, Amethyst, borders and AltTab"
open -a Karabiner-Elements
open -a Amethyst
open -a AltTab
brew services start borders
osascript -e 'tell application "System Events" to if not (exists login item "Amethyst") then make login item at end with properties {path:"/Applications/Amethyst.app", hidden:true}' >/dev/null

cat <<'DONE'

Done. Manual steps left:
  1. Karabiner-Elements: allow its driver extension and Input Monitoring
     when macOS asks. If a "Keyboard Setup Assistant" pops up for the PC
     keyboard, press the key it asks for and pick ANSI. Don't change
     System Settings > Keyboard > Modifier Keys: Karabiner does it all.
  2. Privacy & Security > Accessibility: allow Amethyst and AltTab.
  3. Mission Control: add Desktops until there are 9 (the workspaces).
     Optional: Accessibility > Display > Reduce motion, so switching
     desktops fades instead of sliding.
  4. System Settings > Keyboard > Input Sources: add Japanese. Ctrl+Space
     switches input source.
  5. Log out and back in so the key-repeat settings apply.
  6. Open tmux and press prefix + I to install plugins.
  7. Create ~/.gitconfig with your work email (it isn't in the repo).
DONE
