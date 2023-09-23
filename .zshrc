# phpbrew source $HOME/.phpbrew/bashrc

# phpenv
eval "$(phpenv init -)"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
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
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

hello() {
  echo 'Hello World!'
}

call() {
  echo $1
}

trick() {
  echo 'なぜベストを尽くさないのか'
}

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias -g g='git'
alias -g ga='git add .'
alias -g gplm='git pull origin main'
alias -g gpsh='git push origin head'
alias -g v='nvim'
alias -g n='npm'
alias -g nr='npm run'
alias -g c='composer'
alias -g cr='composer run-script'
alias -g h='history'
alias -g cdp='cd ~/documents/programming'
alias -g cdpi='cd ~/documents/programming/individual_development'
alias -g cdpp='cd ~/documents/programming/python'
alias -g cdpj='cd ~/documents/programming/java'
alias -g gm='gitmoji -c'
alias -g rm='rm -iv'
alias -g l='ls -l'
alias -g cdphp='cd /Users/ryosuke/documents/programming/backend/php'
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'

alias -g L=' | wc -l'
alias -g G=' | grep'
alias -g C=' | pbcopy'
