
# Enable colors and change prompt:
autoload -U colors && colors

# Enable local overrides for zsh configuration
# if [[ -s ~/.zsh/.zshrc.local ]]; then
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
#####################################

# autoload -Uz vcs_info
# autoload -Uz add-zsh-hook
#
# zstyle ':vcs_info:*' enable git svn
# zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "
# precmd() {
#     vcs_info
# }
#
# setopt prompt_subst
# # zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
#
# PROMPT='${vcs_info_msg_0_}%# '


# Khalid snippets
# PROMPT='%B%M%b ${vcs_info_msg_0_}%F{yellow}%(!.%F{red}#%f.%%)%f '
# RPROMPT='%(?.%F{grey}%/%f.:()'

# # Zsh options
# setopt prompt_subst
# autoload -U colors && colors
#
# # Colors
# BLACK=$'\033[0m'
# GREEN=$'\033[38;5;148m'
# BLUE=$'\033[38;5;117m'
# DARK_BLUE='\033[38;5;4m'
#
# current_git_branch() {
#     git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/\(.*\)/(\1)/g'
# }
#
# current_directory() {
#     PROMPT_PATH=""
#     CURRENT=`dirname ${PWD}`
#     if [[ $CURRENT = / ]]; then
#         PROMPT_PATH=""
#     elif [[ $PWD = $HOME ]]; then
#         PROMPT_PATH=""
#     else
#         GIT_REPO_PATH=$(git rev-parse --show-toplevel 2>/dev/null)
#         if [[ -d $GIT_REPO_PATH ]]; then
#             # We are in a git repo. Display the root in color, then the path
#             # starting from the root.
#             if [[ $PWD -ef $GIT_REPO_PATH ]]; then
#                 # We are at the root of the git repo.
#                 PROMPT_PATH=""
#             else
#                 # We are not at the root of the git repo.
#                 BASE=$(basename $GIT_REPO_PATH)
#                 GIT_ROOT="%{$fg_bold[red]%}%{$DARK_BLUE%}${BASE}%{$reset_color%}"
#                 REAL_PWD=$PWD:A
#                 PATH_TO_CURRENT="${REAL_PWD#$GIT_REPO_PATH}"
#                 PATH_TO_CURRENT="%{$BLUE%}${PATH_TO_CURRENT%/*}%{$reset_color%}"
#                 PROMPT_PATH="${GIT_ROOT}${PATH_TO_CURRENT}/"
#             fi
#         else
#             # We are not in a git repo.
#             PATH_TO_CURRENT=$(print -P %3~)
#             PATH_TO_CURRENT="%{$BLUE%}${PATH_TO_CURRENT%/*}%{$reset_color%}"
#             PROMPT_PATH="${PATH_TO_CURRENT}/"
#         fi
#     fi
#     echo "${PROMPT_PATH}%{$reset_color%}%{$fg_bold[red]%}%{$BLUE%}%1~%{$reset_color%}"
# }
#
# export PROMPT=$'$(current_directory) %{$GREEN%}$(current_git_branch)%{$BLACK%}%# '

# zstyle ':vcs_info:git*' formats "- %F{red}%u%f%F{green}%f %b "
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git*' unstagedstr '𥉉' #'

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b ${vcs_info_msg_0_} "

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
# [ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrd"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# . $HOME/dotfiles/alias.sh
. $HOME/dotfiles/functions.sh
. $HOME/.asdf/asdf.sh

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$PATH"

fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# . $HOME/projects/Dev/Zsh_dir/zsh-haskell/haskell.plugin.zsh

# zsh-git-prompt
# . /home/angron/projects/Dev/Zsh_dir/zsh-git-prompt/zshrc.sh
# PROMPT='%B%m%~%b$(git_super_status) %# '


# Enabling cache for the completions for zsh
zstyle ':completion::complete:*' use-cache 1

bindkey "^r" history-incremental-search-backward

export TERM='xterm-256color'
# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#         export TERM='xterm-256color'
# else
#         export TERM='xterm-color'
# fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
# ibus-daemon -drx

# Load aliases and shortcuts if existent.
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Support keyboard navigation in the command prompt
# bindkey "^[[1;3H" backward-word # Fn-Option-Left, Option-Home
# bindkey "^[[1;3F" forward-word  # Fn-Option-Right, Option-End
# bindkey "${terminfo[khome]}" beginning-of-line # Fn-Left, Home
# bindkey "${terminfo[kend]}" end-of-line # Fn-Right, End
# Ctrl-X-e and Ctrl-Space to edit in the editor

# Lines configured by zsh-newuser-install
# bindkey -e
# # End of lines configured by zsh-newuser-install
# # Share history between tmux windows
# setopt SHARE_HISTORY
# setopt hist_ignore_space
# setopt histignoredups
