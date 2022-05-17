#!/usr/bin/env bash

# History in cache directory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

autoload -Uz colors && colors
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_USER_SHOW=false

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

source $PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
