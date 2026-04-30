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

# Check whether brave or brave-beta
browser_bin=$( [[ -f /usr/bin/brave ]] && echo brave || [[ -f /usr/bin/brave-beta ]] && echo brave-beta )

# Default programs:
export EDITOR="nvim"
export MANPAGER='nvim +Man!'
export TERM='xterm-256color'
export TERMINAL="st"
export BROWSER="$browser_bin"
export READER="zathura"

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

# Load ssh key path and add it to an agent when configured.
if [[ -n ${ssh_path:-} ]] && command -v ssh-agent >/dev/null 2>&1 && command -v ssh-add >/dev/null 2>&1; then
  if ! ssh-add -L &>/dev/null; then
    [[ -n ${SSH_AUTH_SOCK:-} ]] || eval "$(ssh-agent -s)" &>/dev/null
    ssh-add "$ssh_path" &>/dev/null
  fi

  ssh_agents=(/tmp/ssh-*/agent.*(N))
  if (( ${#ssh_agents} )) && [[ -d "$HOME/.config" ]]; then
    echo "SSH_AUTH_SOCK=${ssh_agents[1]}" > "$HOME/.config/sshPat"
  fi
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
