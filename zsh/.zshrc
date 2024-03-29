autoload -U colors && colors
bindkey -e

# Shell prompt
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="%B%{$fg[white]%}[%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[yellow]%}%~%{$fg[white]%}]%{$reset_color%}$%b "
else
  PS1="%B%{$fg[white]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[yellow]%}%~%{$fg[white]%}]%{$reset_color%}$%b "
fi

# History in cache directory:
export HISTSIZE=10000
export SAVEHIST=10000000
export HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Aliases
alias vi=nvim
alias vim=nvim
alias vf=vifm
alias g=git
alias t=task
alias tw=timew
alias h=hledger
alias s="sudo systemctl"
alias k=kubectl
alias py=python
alias grep="grep --color=auto"
alias ls="ls --color=auto -hN --group-directories-first"
alias cp="cp -v"
alias rm="rm -v"

# FZF
source /usr/share/fzf/key-bindings.zsh 2> /dev/null
source /usr/share/fzf/completion.zsh 2> /dev/null

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Functions
function fzf-tmux-project() {
  find "$HOME/Documents/Projects" -type d -exec test -e '{}/.git' ';' -print -prune | fzf --height 20% -m | while read root; do
    name=$(basename "$root")
    echo Starting $name
    cd $root
    tmux new-session -d -s $name \; send-keys "nvim" Enter \; split-window -h \; resize-pane -R 50 \; rename-window editor
    cd -
  done;
  zle accept-line
}

function fzf-kill-tmux-project() {
  tmux ls -F "#{session_name}" | fzf --height 20% -m | while read session; do
    tmux kill-session -t $session
  done;
  zle accept-line
}

zle -N fzf-tmux-project
bindkey '^y' fzf-tmux-project

zle -N fzf-kill-tmux-project
bindkey '^x' fzf-kill-tmux-project

# Use vifm to switch directories and bind it to ctrl-o
function vifmcd () {
  lastdir=~/.cache/vifm_lastdir
  vifm . -c ":o" --choose-dir=$lastdir

  if [ -f $lastdir ]; then
      cd $(cat $lastdir)
  fi
}
bindkey -s '^o' 'vifmcd\n'


# Syntax highlighting, must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
