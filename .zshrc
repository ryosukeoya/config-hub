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
alias s='source'
alias nr='npm run'
alias c='composer'
alias cr='composer run-script'
alias gm='gitmoji -c'
alias l='ls -l'
alias la='ls -al'
alias prec="h -n 1 | cut -c 8- | sed -e 's/\n/ /g' C"
alias h='history 0 | tail -n 40'
alias x='xsel --clipboard --input'
alias re='exec $SHELL -l'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias -g G=' | grep'
alias -g L=' | less'
alias -g W=' | wc -l'
alias -g C=' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe'

# Directory hash
hash -d c=/home/ryo
hash -d n=/home/ryo/note
hash -d nb=/home/ryo/note-backup
hash -d s=/home/ryo/source
hash -d z=/home/ryo/source/zsh
hash -d g=/home/ryo/source/go
hash -d a=/home/ryo/source/azure
hash -d sh=/home/ryo/source/shell
hash -d d=/home/ryo/source/docker
hash -d b=/home/ryo/source/baleen-studio

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
  # -p: Parent Directory
  if [ "$1" = 'p' ]; then
    current_dir=$(basename $PWD)
    filename+="-${current_dir}"
  elif [ -n "$1"]; then
    filename+="-$1"
  fi

  ex='md'
  [ -n "$2" ] && ex="$2"

  touch "${filename}.${ex}"
}
