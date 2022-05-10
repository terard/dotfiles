# (installed with homebrew)
FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export HISTCONTROL=erasedups
HISTCONTROL=ignoreboth
setopt HIST_IGNORE_ALL_DUPS

export STARSHIP_CONFIG=~/starship.toml

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export VISUAL="nvim"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

# maybe find a better way to do this?
# chruby ruby-3.0.1

# alias
alias l='ls -lah'
alias ls='ls -G'
alias ll='ls -lG'
alias t="tree"
alias h="history"

alias zrc='nvim ~/.zshrc; . ~/.zshrc'
alias vim='nvim'
alias v='nvim .'
alias vrc='nvim ~/.config/nvim/init.vim'
alias nvrc='vrc'

alias gs="git status"
alias gp="git push"
alias gf="git fetch"
alias gitpush="git push"
alias gb="git branch"
alias gd="git diff"
alias gc="git commit"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gra="git rebase --abort"
alias glo='git log --oneline --no-decorate -n 35; echo "..."'

alias pryor="bundle exec pry -r ./config/environment"
alias pg_start="brew services start postgresql"
alias pg_stop="brew services stop postgresql"
alias raket="rake -T"

# tmux
bindkey -s ^f "tmux-sessionizer\n"
alias tmus="tmux"
alias tls="tmux ls"
alias ta="tmux attach"
alias tns="tmux new-session"
alias tnd="tmux new-session -d "
alias tnw="tmux new-window"
alias tk="tmux kill-server"

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'


# should be at the end (installed with homebrew)
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# should be at the end (installed with homebrew)
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
