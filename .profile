export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export LC_MONETARY=cs_CZ.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"

export BROWSER=firefox
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export TERMINAL=alacritty

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# shellcheck source=/dev/null
[ -f "$XDG_CONFIG_HOME"/secrets ] && source "$XDG_CONFIG_HOME"/secrets

#######################################################################
# Fixing paths to comply XDG standards (and to have cleaner home dir) #
# More: https://wiki.archlinux.org/index.php/XDG_Base_Directory       #
#######################################################################

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Flutter, Dart
export PATH=/opt/flutter/bin:"$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium

# Google Test / GTest
export GTEST_COLOR=1

# Homebrew (only for mac)
if [ "$(uname)" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="$HOMEBREW_PREFIX/opt/libpq/bin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"
  export PATH="$HOMEBREW_PREFIX/opt/trash-cli/bin/:$PATH"
fi

# ICE (X11 Inter-Client Exchange library)
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

# Go
export GOPATH="$XDG_DATA_HOME"/go
export PATH="$XDG_DATA_HOME"/go/bin:"$PATH"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# GTK
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Haskell
export GHCUP_USE_XDG_DIRS=true

# ipython / jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# less: disable less history
export LESSHISTFILE=-

# Use nvim as man pager if available
command -v nvim >/dev/null && export MANPAGER='nvim +Man!'

# node / npm
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PATH="$PATH":node_modules/.bin:"$XDG_DATA_HOME"/npm/bin

# OpenSSL (.rnd)
export RANDFILE=/tmp/.rnd

# Pass (Password manager)
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
[ "$(uname)" = "Linux" ] && export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
[ "$(uname)" = "Darwin" ] && export PASSWORD_STORE_EXTENSIONS_DIR="$HOMEBREW_PREFIX"/lib/password-store/extensions

# Postgresql / psql
export PSQL_HISTORY="$XDG_CACHE_HOME/psql_history"

# Python
export PYTHON_HISTORY="$XDG_CACHE_HOME/python_history"

# pre-commit colors fix
export PRE_COMMIT_COLOR=always

# Redis
export REDISCLI_HISTFILE="$XDG_DATA_HOME"/redis/rediscli_history
export REDISCLI_RCFILE="$XDG_CONFIG_HOME"/redis/redisclirc

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

# Sqlite3
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history
alias sqlite='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
alias sqlite3="sqlite"

# Taskwarrior
export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/config

# Tex
export TEXLIVE=$XDG_DATA_HOME/texlive
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# Vagrant
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant

# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# ZSH
export ZDOTDIR="${XDG_CONFIG_HOME}"/zsh

# zplug (zsh plugin manager)
export ZPLUG_HOME="$XDG_DATA_HOME"/zplug
