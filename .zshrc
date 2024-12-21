# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

PROMPT='%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[yellow]%}%1{➜%}) %{$fg_bold[red]%}$(git_prompt_info) %{$fg[cyan]%}%3~%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} %{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}  "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Prompt
# PROMPT="%B%K{236}%F{252}%n@%m %3d %f%k%b > "
# ~/.zshrc に以下の行を追加

# History
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=200
export SAVEHIST=5000

# Bindkey
bindkey -e

# History Beginning Search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^o' history-beginning-search-backward-end
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
alias h='history 0 | tail -n 80'
alias x='xsel --clipboard --input'
alias re='exec $SHELL -l'

alias scd='cd $(find ~sa -maxdepth 1 -type d | peco)'
alias sco='code $(find ~sa -maxdepth 1 -type d | peco)'
alias sa='code --add $(find ~sa -maxdepth 1 -type d | peco)'
alias scp='find ~sa -type -maxdepth 1 d | peco C'

alias ghp='history | peco'
alias gcdr='cd $(ghq root | peco)'
alias gcd='cd $(ghq list -p | peco)'
alias gco='code $(ghq list -p | peco)'
alias gcof='code $(ghq list -p | fzf)'
alias gcow='code $(find /home/ryo/ghq/github.com/plusmedi/sandbox-ryosukeoya/workspaces -maxdepth 1 | peco)'
alias pc='find /home/ryo/ghq/github.com/ryosukeoya/prompt -maxdepth 1 -type f | peco | xargs cat C'
alias ga='code --add $(ghq list -p | peco)'
alias gcp='ghq list -p | peco C'
alias gbr='gh browse --repo $(ghq list | peco)'
alias gb='gh browse'
alias cb="git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D"
alias refl="git for-each-ref --sort=-creatordate --format='%(creatordate:short) %(refname:short)' refs/heads/"
alias tagv="git for-each-ref --sort=-taggerdate --format '%(refname:short) %(taggerdate:short) %(taggername) %(subject)' refs/tags | less"
alias ggr="git log --oneline --decorate --graph --branches --tags --remotes"
alias ilist="gh issue list --state open --assignee ryosukeoya"
alias plist="gh pr list --state open --assignee ryosukeoya"
alias pp='cat $(find /home/ryo/ghq/github.com/baleen-studio/ryosukeoya/prompt -maxdepth 1 | peco)'
alias lbd='git branch | xargs git branch -d'
alias cover='go tool cover -html=/tmp/vscode-gowctahn/go-code-cover -o cover-vs.html'
alias migf='date +%Y%m%d%H%M%S'
alias ct='go-cover-treemap'
alias ctp='go-cover-treemap -coverprofile cover.out > my_out.svg && code my_out.svg'
alias addws='ls | xargs code --add'

# Plusmedi
alias rlist="gh issue list --label release --repo plusmedi/mhv2-infra"
alias tools="/home/ryo/ghq/github.com/plusmedi/sandbox-ryosukeoya/tools"
alias copy_issue_full_path='ls /home/ryo/ghq/github.com/plusmedi/sandbox-ryosukeoya/issues | fzf | xargs realpath C'

alias code='/mnt/c/Users/大屋諒恭/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'
alias explorer='/mnt/c/Windows/explorer.exe'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias -g J=' | jq .'
alias -g G=' | grep'
alias -g L=' | less'
alias -g W=' | wc -l'
alias -g C=' | iconv -t utf16 | /mnt/c/Windows/System32/clip.exe'
# change the error color to red
alias -g EE="| awk '{gsub(/error|Error/, \"\033[31m&\033[0m\"); print}'"
alias -g TR="| awk '{gsub(/Error|FAIL/, \"\033[31m&\033[0m\"); print}'"
alias -g TC="| awk '{gsub(/Error|FAIL/, \"\033[31m&\033[0m\"); gsub(/SETUP|RUN|CONT|PAUSE/, \"\033[36m&\033[0m\"); gsub(/+/, \"\033[32m&\033[0m\"); gsub(/-/, \"\033[35m&\033[0m\"); print}'"

# Directory Hash
hash -d z="${HOME}/.zshrc"
hash -d s="${HOME}/ghq/github.com/baleen-studio/ryosukeoya/sandbox"
hash -d S="${HOME}/ghq/github.com/plusmedi/sandbox-ryosukeoya"
hash -d n="${HOME}/source/note"
hash -d g="${HOME}/ghq/github.com"
hash -d b="${HOME}/ghq/github.com/baleen-studio"
hash -d p="${HOME}/ghq/github.com/plusmedi"
hash -d r="${HOME}/ghq/github.com/ryosukeoya"
hash -d Z="${HOME}/ghq/github.com/ryosukeoya/zsh"
hash -d g="${HOME}/ghq/github.com/ryosukeoya/git"
hash -d v="${HOME}/ghq/github.com/ryosukeoya/vscode"
hash -d vs='/mnt/c/Users/大屋諒恭/AppData/Roaming/Code/User'

# Direnv
eval "$(direnv hook zsh)"

# Exports
export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR=nvim

# Go
go_version=go1.23.0
go_path_install_cmd_binary=${HOME}/go/bin
go_path_release_binary=${HOME}/source/go/bin

export PATH="${go_path_install_cmd_binary}:${go_path_release_binary}:${PATH}"
ln -sf "${go_path_install_cmd_binary}/${go_version}" "${go_path_install_cmd_binary}/go"
# バイナリからインストールしたgoはsourceディレクトリに置いてある
ln -sf "${go_path_release_binary}/go1.23.3" "${go_path_release_binary}/go"

export GOPRIVATE=github.com/baleen-studio,github.com/plusmedi,github.com/ryosukeoya

# エイリアスだと子プロセスに影響しないから辞めた
# alias go="${go_version}"
# ln -s "${HOME}/source/go/bin/go ${HOME}/source/go/bin/${go_version}"
# VSCode
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

function sadd {
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_ed25519
}

# Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"

# Functions
# autoloadで読み込まれた関数は、現在のシェルセッション内で実行される
# $PATHに追加されたスクリプトは、別のシェルインスタンスとして実行される
export PATH=/home/ryo/ghq/github.com/ryosukeoya/zsh/cmd:/home/ryo/ghq/github.com/ryosukeoya/zsh/cmd/plusmedi:$PATH

export CMD_PATH="${HOME}/ghq/github.com/ryosukeoya/zsh/cmd"
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/list-tag.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/copy-tag.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/copy-history.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/exec-history.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/copy-git-square-brackets.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/diff-name-only.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/diff-merge-commit.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/diff-merge-commit-with-format.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/show-diff-file.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/grep-text-in-gomod.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/sort-gomod-directives.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/all-github-browse.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/search_text.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/edit_issue.sh
# g log --oneline --grep "^\[moc/schedule\]"

autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/backup.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/month.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/push.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/cmd/today.sh
autoload -U ${HOME}/ghq/github.com/ryosukeoya/zsh/z-push.sh

# Pluemedi
export PATH_PLUSMEDI_CMD="${HOME}/ghq/github.com/plusmedi/sandbox-ryosukeoya/tools/cmd"
export PATH_PLUSMEDI_WORKSPACES="${HOME}/ghq/github.com/plusmedi/sandbox-ryosukeoya/workspaces"
export PATH="${CMD_PATH_PLUSMEDI}:${PATH}"

# Node
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# function search-history() {
#   local c=$(history | peco | sed -E 's/ *[0-9]+\*? *//')
#   if [[ -n $c ]]; then
#     eval "$c"
#   fi
# }

zle -N search-history
bindkey "^Xh" search-history

alias rw='rename-gowork.sh'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='
  --color=fg:#D8DEE9,fg+:#eeeeee,hl:#800080,hl+:#800080,bg+:#b673ec,marker:#E17899
  --color=marker:#ffffff,spinner:#4C566A,header:#4C566A,gutter:-1
  --color=info:#d4d429,prompt:#800080,pointer:#c2fc8f
  --layout="reverse"
  --prompt=" | "
  --marker=" >"
  --pointer=" >"
'

# flutter
export PATH="${HOME}/development/flutter/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export CHROME_EXECUTABLE="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"
