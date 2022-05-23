export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# (installed with homebrew)
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#export PREFIX="/opt/homebrew/bin/n"
#export N_PREFIX="/opt/homebrew/bin/n"
export N_CACHE_PREFIX=$HOME/.n/versions
unset PREFIX
unset N_PREFIX
unset N_CACHE_PREFIX

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
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

# maybe find a better way to do this?
# chruby ruby-3.0.1

export PATH="$HOME/.local/bin:$PATH"

# rust
export PATH="$(brew --prefix)/bin/rust-analyzer:$PATH"
export PATH=$HOME/.cargo/bin:$PATH

# alias
alias l='ls -lah'
alias ls='ls -G'
alias ll='ls -lG'
alias t="tree -la -I .git"
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
#source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# should be at the end (installed with homebrew)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
