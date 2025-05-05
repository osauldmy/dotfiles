################################################################################
#                            ZSH options / settings                            #
################################################################################

setopt append_history
setopt auto_cd
setopt correct
setopt extended_glob
setopt extended_history
setopt interactive_comments
setopt menu_complete
setopt no_match
setopt notify
setopt prompt_subst
setopt hist_ignore_space

unsetopt correct_all
unsetopt beep
bindkey -e

# History settings
HISTFILE="$XDG_CACHE_HOME"/zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE


# Fix delete key (returns tilde, but does not delete) and so on
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

bindkey "^U"    backward-kill-line
bindkey "^u"    backward-kill-line
bindkey "^[l"   down-case-word
bindkey "^[L"   down-case-word

# alt+<- | alt+->
bindkey "^[f" forward-word
bindkey "^[b" backward-word

# ctrl+<- | ctrl+->
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5A" forward-word
bindkey "^[[1;5B" forward-word

# disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# My aliases & custom functions
source "$XDG_CONFIG_HOME/aliases"
source "$XDG_CONFIG_HOME/functions"

# FIX for zsh on mac
export DEFAULT_USER=$USER

################################################################################
#                           Configure completion(s)                            #
################################################################################

[ "$(uname)" = "Darwin" ] && fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
[ "$(uname)" = "Linux" ] && fpath=(/usr/share/zsh/site-functions ~/.config/zsh/site-functions $fpath)

zstyle :compinstall filename "$XDG_CONFIG_HOME/zsh/.zshrc"
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':completion:*' list-dirs-first false
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu yes select
zstyle ':completion:*' rehash true # new installed programs appear in path

autoload -Uz compinit
# Speeding up compinit. Only call compinit once a day (for all dumps) or use -C flag.
for dump in ~/.config/zsh/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# command -v pyenv >/dev/null 2>/dev/null && eval "$(pyenv init -)"

################################################################################
#                         Plugins / Themes / Ricing                            #
################################################################################
source "$ZPLUG_HOME"/init.zsh

if ! command -v zplug >/dev/null; then
  git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
fi

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "agnoster/agnoster-zsh-theme", as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
# zplug "marlonrichert/zsh-autocomplete"

# if ! zplug check; then
#   zplug install
# fi

zplug load
