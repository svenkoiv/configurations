#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=vim
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Configure command history
export HISTSIZE=3000
export HISTFILESIZE=3000
# To append commands to the history file, rather than overwrite it, add the following line to ~/.bashrc:
shopt -s histappend
