# Prompt
PROMPT="%B%K{236}%F{252}%n@%m %3d %f%k%b > "

# eval `ssh-agent`

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
alias gl='git log --oneline'
alias gg='git log --graph'
alias gm='gitmoji -c'
alias gc='git-cz --scope'
alias ghb='gh browse'
alias n='npm'
alias nr='npm run'
alias c='composer'
alias cr='composer run-script'
alias hu='hugo'
alias hus='hugo server'
alias pks='pkgsite -open .'
alias prec="h -n 1 | cut -c 8- | sed -e 's/\n/ /g' C"
alias h='history 0 | tail -n 40'
alias x='xsel --clipboard --input'
alias re='exec $SHELL -l'

alias scd='cd $(find ~sa -maxdepth 1 -type d | peco)'
alias sco='code $(find ~sa -maxdepth 1 -type d | peco)'
alias sa='code --add $(find ~sa -maxdepth 1 -type d | peco)'
alias scp='find ~sa -type -maxdepth 1 d | peco C'

alias gcd='cd $(ghq list -p | peco)'
alias gco='code $(ghq list -p | peco)'
alias ga='code --add $(ghq list -p | peco)'
alias gcp='ghq list -p | peco C'
alias gb='gh browse --repo $(ghq list | peco)'

alias code='/mnt/c/Users/大屋諒恭/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'
alias explorer='/mnt/c/Windows/explorer.exe'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias -g G=' | grep'
alias -g L=' | less'
alias -g W=' | wc -l'
alias -g C=' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe'
# change the error color to red
alias -g EE="| awk '{gsub(/error|Error/, \"\033[31m&\033[0m\"); print}'"

# Directory Hash
hash -d s="${HOME}/source"
hash -d sa="${HOME}/source/sandbox"
hash -d n="${HOME}/source/note"
hash -d gh="${HOME}/ghq/github.com"
hash -d b="${HOME}/ghq/github.com/baleen-studio"
hash -d p="${HOME}/ghq/github.com/plusmedi"
hash -d r="${HOME}/ghq/github.com/ryosukeoya"
hash -d z="${HOME}/ghq/github.com/ryosukeoya/zsh"
hash -d g="${HOME}/ghq/github.com/ryosukeoya/git"
hash -d v="${HOME}/ghq/github.com/ryosukeoya/vscode"
hash -d vs='/mnt/c/Users/大屋諒恭/AppData/Roaming/Code/User'

# Direnv
eval "$(direnv hook zsh)"

# Exports
export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR=nvim

# Go
export GOROOT="${HOME}/source/goroot"
export GOPATH="${HOME}/source/gopath"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"
export GOPRIVATE=github.com/baleen-studio,github.com/plusmedi,github.com/ryosukeoya

# VSCode
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"

# Functions
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/backup.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/push.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/month.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/today.sh

# Node
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
