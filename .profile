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

# Android
# export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
# export ANDROID_HOME=$XDG_CONFIG_HOME/android/Sdkexport
# export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
# export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator
# export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
# export ADB_KEYS_PATH="$ANDROID_PREFS_ROOT"
# export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
# PATH=$PATH:$ANDROID_HOME/emulatorexport
# PATH=$PATH:$ANDROID_HOME/toolsexport
# PATH=$PATH:$ANDROID_HOME/tools/binexport
# PATH=$PATH:$ANDROID_HOME/platform-tools

# export PATH=/opt/android-sdk/tools:$PATH
# export PATH=/opt/android-sdk/tools/bin:$PATH
export PATH=/opt/android-sdk/cmdline-tools/latest/bin/:$PATH

# Arduino (imo a little better version than setting alias for exe with config path)
export ARDUINO_DIRECTORIES_USER="$XDG_DATA_HOME/arduino/user"
export ARDUINO_DIRECTORIES_DATA="$XDG_DATA_HOME/arduino/data"
export ARDUINO_DIRECTORIES_DOWNLOADS="$XDG_DATA_HOME/arduino/downloads"

# AWS
# export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
# export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# Conan (C++ build system)
export CONAN_USER_HOME="$XDG_CONFIG_HOME"

# CUDA / Nvidia
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# elinks
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Flutter, Dart
export PATH=/opt/flutter/bin:"$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium

# Google Test / GTest
export GTEST_COLOR=1

# ICE (X11 Inter-Client Exchange library)
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

# python-gitlab / GitLab CLI
export PYTHON_GITLAB_CFG="$XDG_CONFIG_HOME/python_gitlab/config"

# GNUpg
# export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# alias gpg='gpg2 --homedir "$XDG_DATA_HOME"/gnupg'
# alias gpg2='gpg2 --homedir "$XDG_DATA_HOME"/gnupg'

# Go
export GOPATH="$XDG_DATA_HOME"/go
export PATH="$XDG_DATA_HOME"/go/bin:"$PATH"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# GTK
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Haskell
export PATH=~"/.ghcup/ghc/*/bin":"$PATH"
export PATH=~/.ghcup/bin/:"$PATH"
export PATH=~/.cabal/bin/:"$PATH"

# ipython / jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# Java/OpenJDK
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# less: disable less history
export LESSHISTFILE=-

# Mathematica
export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME"/mathematica

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

# Python related
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export PATH="$PYENV_ROOT"/bin:"$PATH"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python_startup.py

# pre-commit colors fix
export PRE_COMMIT_COLOR=always

# Redis
export REDISCLI_HISTFILE="$XDG_DATA_HOME"/redis/rediscli_history
export REDISCLI_RCFILE="$XDG_CONFIG_HOME"/redis/redisclirc

# Ruby
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
# export PATH="${GEM_HOME}"/ruby/*/bin:"$PATH"

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

# SageMath
export DOT_SAGE="$XDG_CONFIG_HOME"/sage

# Sqlite3
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
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

# wget
alias wget='/usr/bin/wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# ZSH
export ZDOTDIR="${XDG_CONFIG_HOME}"/zsh

# zplug (zsh plugin manager)
export ZPLUG_HOME="$XDG_DATA_HOME"/zplug
