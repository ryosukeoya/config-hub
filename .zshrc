# Prompt
PROMPT="%B%K{236}%F{252}%n@%m %C %f%k%b > "

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=200
export SAVEHIST=1000

# Bindkey
bindkey -e

# History beginning search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end

# Aliases
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias g='git'
alias ga='git add .'
alias v='nvim'
alias n='npm'
alias nr='npm run'
alias c='composer'
alias cr='composer run-script'
alias gm='gitmoji -c'
alias l='ls -l'
alias prec="h -n 1 | cut -c 8- | sed -e 's/\n/ /g' C"
alias h='history 0 | tail -n 40'
alias x='xsel --clipboard --input'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias -g C=' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe'
alias -g W=' | wc -l'
alias -g G=' | grep'
alias -g L=' | less'
alias -g s='source'
alias -g re='exec $SHELL -l'

# Directory hash
hash -d c=/mnt/c
hash -d n=/mnt/c/note
hash -d nb=/mnt/c/note-backup
hash -d s=/mnt/c/source
hash -d g=/mnt/c/source/go
hash -d a=/mnt/c/source/azure
hash -d sh=/mnt/c/source/shell
hash -d d=/mnt/c/source/docker
hash -d b=/mnt/c/source/baleen-studio

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/source/go
export PATH=$HOME/.local/bin:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Direnv
eval "$(direnv hook bash)"

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Editor
export EDITOR=nvim

# Functions
function today() {
  filename="$(date "+%F")"
  [ -n "$1" ] && filename+="-$1"

  ex='md'
  [ -n "$2" ] && ex="$2"

  touch "${filename}.${ex}"
}
