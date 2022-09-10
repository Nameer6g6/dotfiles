
# Enable colors and change prompt:
autoload -U colors && colors

# Enable local overrides for zsh configuration
if [[ -s $ZDOTDIR/.zshrc.local ]]; then
  source $ZDOTDIR/.zshrc.local
fi
# Add all files in ~/.zsh as autoloaded functions
fpath=($ZDOTDIR $fpath)
autoload $(ls $ZDOTDIR)

# Different useful things making Zsh more powerful
autoload -U zmv
setopt extended_glob

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '$ZDOTDIR/.zshrc'
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -u
# End of lines added by compinstall

# Support TAB/TAB/TAB for repeated autocompletion
zmodload zsh/complist
bindkey -M menuselect '^I' accept-and-infer-next-history

# Workaround for zsh 5.2 release
autoload +X VCS_INFO_nvcsformats
functions[VCS_INFO_nvcsformats]=${functions[VCS_INFO_nvcsformats]/local -a msgs/}
# # Lines for vcs_info prompt configuration
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%{%F{green}%B%}●%{%b%f%}'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%B%}●%{%b%f%}'
zstyle ':vcs_info:*' formats '%{%F{cyan}%}%45<…<%R%<</%{%f%}%{%F{green}%}(%25>…>%b%<<)%{%f%}%{%F{cyan}%}%S%{%f%}%c%u'
zstyle ':vcs_info:*' actionformats '%{%F{cyan}%}%45<…<%R%<</%{%f%}%{%F{red}%}(%a|%m)%{%f%}%{%F{cyan}%}%S%{%f%}%c%u'
zstyle ':vcs_info:*' nvcsformats '%{%F{cyan}%}%~%{%f%}'
zstyle ':vcs_info:git:*' patch-format '%10>…>%p%<< (%n applied)'
zstyle ':vcs_info:*+set-message:*' hooks home-path
function +vi-home-path() {
  # Replace $HOME with ~
  hook_com[base]="$(echo ${hook_com[base]} | sed "s/${HOME:gs/\//\\\//}/~/" )"
}
zstyle ':vcs_info:git+post-backend:*' hooks git-remote-staged
function +vi-git-remote-staged() {
  # Show "unstaged" when changes are not staged or not committed
  # Show "staged" when last committed is not pushed
  #
  # See original VCS_INFO_get_data_git for implementation details

  # Set "unstaged" when git reports either staged or unstaged changes
  if (( gitstaged || gitunstaged )) ; then
    gitunstaged=1
  fi

  # Set "staged" when current HEAD is not present in the remote branch
  if (( querystaged )) && \
     [[ "$(${vcs_comm[cmd]} rev-parse --is-inside-work-tree 2> /dev/null)" == 'true' ]] ; then
      # Default: off - these are potentially expensive on big repositories
      if ${vcs_comm[cmd]} rev-parse --quiet --verify HEAD &> /dev/null ; then
          gitstaged=1
          if ${vcs_comm[cmd]} status --branch --short | head -n1 | grep -v ahead > /dev/null ; then
            gitstaged=
          fi
      fi
  fi

  hook_com[staged]=$gitstaged
  hook_com[unstaged]=$gitunstaged
}
autoload -Uz vcs_info
function precmd() { vcs_info }
setopt prompt_subst
PROMPT='%(?..%{%F{red}%}%?%{%f%} )%{%F{green}%}%n%{%f%}@%{%F{red}%}%m%{%f%}:${vcs_info_msg_0_}%{%B%} %{%F{magenta}%}λ%(!.#.>)%{%b%E%}%{%f%} '
# End of lines for vcs_info prompt configuration

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '^ ' edit-command-line

# Enable inline syntax highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta,bold'
if [[ -s /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -s /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
# bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

. $HOME/dotfiles/functions.sh
. $HOME/dotfiles/secrets.sh
. $HOME/.asdf/asdf.sh

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$PATH"

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# Enabling cache for the completions for zsh
zstyle ':completion::complete:*' use-cache 1

bindkey "^r" history-incremental-search-backward

export TERM='xterm-256color'

# Load ssh key path and load it to the agent
eval `ssh-agent -s` &> /dev/null
ssh-add -L &>/dev/null
if [ $? -ne 0 ]; then
     ssh-add $ssh_path &>/dev/null
fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# ibus-daemon -drx

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
