autoload -U colors && colors
PS1="%B%{$fg[white]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[yellow]%}%~%{$fg[white]%}]%{$reset_color%}$%b "
bindkey -e

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
alias s="sudo systemctl"

# FZF
source /usr/share/fzf/key-bindings.zsh 2> /dev/null
source /usr/share/fzf/completion.zsh 2> /dev/null

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Syntax highlighting, must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
