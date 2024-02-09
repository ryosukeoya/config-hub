# Prompt
PROMPT="%B%K{236}%F{252}%n@%m %C %%f%k%b > "

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=200
export SAVEHIST=1000

# History beginning search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# Aliases
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias -g g='git'
alias -g ga='git add .'
alias -g v='nvim'
alias -g n='npm'
alias -g nr='npm run'
alias -g c='composer'
alias -g cr='composer run-script'
alias -g gm='gitmoji -c'
alias -g l='ls -l'
alias -g h='history 0 | tail -n 40'
alias -g x='xsel --clipboard --input'

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'

alias -g C=' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe'
alias -g W=' | wc -l'
alias -g G=' | grep'
alias -g L=' | less'
alias -g s='source'
alias -g re='exec $SHELL -l'

# Directory hash
hash -d c=/mnt/c
hash -d n=/mnt/c/note
hash -d s=/mnt/c/source
hash -d g=/mnt/c/source/go
hash -d a=/mnt/c/source/azure
hash -d sh=/mnt/c/source/shell
hash -d d=/mnt/c/source/docker
hash -d b=/mnt/c/source/baleen-studio

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/source/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# direnv
eval "$(direnv hook bash)"

# dotnet

# pyenv

# bindkey

# Editor
export EDITOR=nvim
