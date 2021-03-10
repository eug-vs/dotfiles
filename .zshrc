export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME="ys"

plugins=(git)
source $ZSH/oh-my-zsh.sh

alias vi=nvim
alias vim=nvim
alias mux=tmuxinator
alias config='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:~/.local/bin

