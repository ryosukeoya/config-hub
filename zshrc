# Prompt
PROMPT="%B%K{236}%F{252}%n@%m %3d %f%k%b > "

eval `ssh-agent`

# History
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=200
export SAVEHIST=1000

# Bindkey
bindkey -e

# History Beginning Search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end

# Aliases
alias s='source'
alias rm='rm -i'
alias l='ls -l'
alias la='ls -al'
alias v='nvim'
alias g='git'
alias ga='git add .'
alias gm='gitmoji -c'
alias n='npm'
alias nr='npm run'
alias c='composer'
alias cr='composer run-script'
alias prec="h -n 1 | cut -c 8- | sed -e 's/\n/ /g' C"
alias h='history 0 | tail -n 40'
alias x='xsel --clipboard --input'
alias re='exec $SHELL -l'
alias code='/mnt/c/Users/大屋諒恭/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'
# alias explorer='/mnt/c/Windows/explorer.exe'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias -g G=' | grep'
alias -g L=' | less'
alias -g W=' | wc -l'
alias -g C=' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe'

# Directory Hash
hash -d s="${HOME}/source"
hash -d gh="${HOME}/ghq/github.com"
hash -d b="${HOME}/ghq/github.com/baleen-studio"
hash -d p="${HOME}/ghq/github.com/plusmedi"
hash -d r="${HOME}/ghq/github.com/ryosukeoya"
hash -d z="${HOME}/ghq/github.com/ryosukeoya/zsh"
hash -d g="${HOME}/ghq/github.com/ryosukeoya/git"
hash -d v="${HOME}/ghq/github.com/ryosukeoya/vscode"
hash -d n='/mnt/c/Users/大屋諒恭/OneDrive - Baleen Studio/ドキュメント/note'

# Direnv
eval "$(direnv hook zsh)"

# Exports
export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR=nvim

# Go
export GOROOT=/usr/local/go
export GOPATH="${HOME}/source/go"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"
export GOPRIVATE=github.com/baleen.studio,github.com/plusmedi,$(go env GOPRIVATE) 

# VSCode
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"

# Functions
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/push.sh

function today() {
  local filename="$(date "+%F")"
  # c: Current Directory
  if [ "$1" = 'c' ]; then
    filename+="-$(basename $PWD)"
  elif [ -n "$1" ]; then
    filename+="-$1"
  fi

  ex='md'
  [ -n "$2" ] && ex="$2"

  touch "${filename}.${ex}"
}

function ghq_peco {
  local dir="$(ghq list -p | peco)"
  if [ ! -z "${dir}" ] ; then
    cd "$dir"
    code .
  fi
}
