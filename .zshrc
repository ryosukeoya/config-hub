# phpenv
eval "$(phpenv init -)"

# pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Prompt
PROMPT="%n@%m %/$ "
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f \$ '

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=2000
export SAVEHIST=100000

# History beginning search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

# bindkey
bindkey '^p^u' push-line

# Functions
hello() {
  echo 'Hello World!'
}

call() {
  echo $1
}

trick() {
  echo 'なぜベストを尽くさないのか'
}

# Aliases
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias -g g='git'
alias -g ga='git add .'
alias -g v='nvim'
alias -g n='npm'
alias -g nr='npm run'
alias -g c='composer'
alias -g cr='composer run-script'
alias -g h='history'
alias -g gm='gitmoji -c'
alias -g rm='rm -iv'
alias -g l='ls -l'

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'

alias -g L=' | wc -l'
alias -g G=' | grep'
alias -g C=' | pbcopy'

# Directory hash
hash -d p=/Users/ryosuke/Documents/programming
hash -d i=/Users/ryosuke/Documents/programming/individual_development
hash -d ph=/Users/ryosuke/Documents/programming/backend/php
hash -d py=/Users/ryosuke/Documents/programming/backend/python
hash -d cs=/Users/ryosuke/Documents/programming/backend/csharp
hash -d g=/Users/ryosuke/Documents/programming/backend/go
hash -d j=/Users/ryosuke/Documents/programming/java
hash -d m=/Applications/MAMP

eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
