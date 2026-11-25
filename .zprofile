#!/bin/zsh

if command -v ruby >/dev/null 2>&1; then
  PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi
PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:$HOME/.local/share/cargo/bin/

typeset -U PATH path
BINPATH="$HOME/.local/bin"
path+=("$BINPATH" ${BINPATH}/*/)
export PATH

# macOS: Homebrew, GNU userland ahead of BSD tools, Linux shims (notify-send, xclip)
if [[ $OSTYPE == darwin* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
  # Nix: the installer hooks /etc/zshrc, but macOS updates reset that file
  nix_sh=/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  [[ -r $nix_sh ]] && . $nix_sh
  unset nix_sh
  for gnu in coreutils gnu-sed grep findutils gawk; do
    [[ -d $HOMEBREW_PREFIX/opt/$gnu/libexec/gnubin ]] && path=("$HOMEBREW_PREFIX/opt/$gnu/libexec/gnubin" $path)
  done
  path=("$HOME/dotfiles/macos/bin" $path)
  export PATH
fi

# Check whether brave or brave-beta
browser_bin=$( [[ -f /usr/bin/brave ]] && echo brave || [[ -f /usr/bin/brave-beta ]] && echo brave-beta )

# Default programs:
export EDITOR="nvim"
export MANPAGER='nvim +Man!'
export TERMINAL="st"
export BROWSER="$browser_bin"
export READER="zathura"
if [[ $OSTYPE == darwin* ]]; then
  export TERMINAL="wezterm" BROWSER="open" READER="open" OPENER="open"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOBIN="$GOPATH/bin"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"



# TODO: Make it dynamically scale if the display was 4k
# Display for 4k
export QT_SCALE_FACTOR=1.5


# Checking zshrc config
# if test -n "$ZDOTDIR" && test -r "$ZDOTDIR/.zshrc" ; then
#    export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# elif test -r $HOME/.zshrc ; then
#    . $HOME/.zshrc
# fi

# if [[ $TERM == xterm-termite ]]; then
# if [[ $TERM == xterm-alacritty ]]; then
#   . /etc/profile.d/vte.sh
#   __vte_osc7
# fi

# One ssh-agent per login, shared by terminals and by GUI apps started from
# xmonad (Obsidian's git signs commits through it). lightdm sources this file
# via ~/.xprofile with /bin/sh, so keep this block POSIX.
if command -v ssh-agent >/dev/null 2>&1; then
  ssh_env="${XDG_RUNTIME_DIR:-$HOME/.cache}/ssh-agent.env"
  ssh-add -l >/dev/null 2>&1
  # Exit code 2: no agent reachable -> reuse this login's agent or start one
  if [ $? -eq 2 ]; then
    [ -f "$ssh_env" ] && . "$ssh_env" >/dev/null
    ssh-add -l >/dev/null 2>&1
    if [ $? -eq 2 ]; then
      (umask 077; ssh-agent -s > "$ssh_env")
      . "$ssh_env" >/dev/null
    fi
  fi
  ssh-add -l >/dev/null 2>&1 ||
    ssh-add "${ssh_path:-$HOME/.ssh/id_ed25519}" </dev/null >/dev/null 2>&1
  unset ssh_env
fi

export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
"

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null
