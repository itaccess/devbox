# https://superuser.com/a/66874
export COPYFILE_DISABLE=true

export TERM=xterm-256color

export PATH=~/bin:$PATH
export PATH=/usr/local/bin:$PATH

alias stripcolor='sed $'\''s/\E[^m]*m//g'\'

alias pfx='basename $(git symbolic-ref --short HEAD)'

alias //='grt'

ghcreate() {
  GITHUB_USER=$(git config --global --get github.user)
  if [ "$GITHUB_USER" != "" ]; then
    if [ "$1" != "" ]
    then
      REPONAME=$1
    else
      REPONAME=$(basename $(pwd))
    fi
    curl -u ${GITHUB_USER} https://api.github.com/user/repos -d "{\"name\":\"${REPONAME}\"}"
    echo ""
    echo "https://github.com/${GITHUB_USER}/${REPONAME}/ probably created, you can try pushing with:"
    echo ""
    echo "    git remote add origin git@github.com:${GITHUB_USER}/${REPONAME}.git"
    echo "    git push -u origin master"
  else
    echo "need to set global github user: git config --global --add github.user myghusername"
  fi
}

history_search_or() {
  if [ "$1" != "" ]; then
    history | eval "grep -e '$(echo $@ | sed -E 's/(\w*) /\1\\\|/g')'"
  else
    history
  fi
}
alias hor=history_search_or

history_search() {
  if [ "$1" != "" ]; then
    history | eval "grep -e $(echo $@ | sed -E 's/(\w*) /\1 | grep -e /g') | grep -e '$(echo $@ | sed -E 's/(\w*) /\1\\\|/g')'"
  else
    history
  fi
}
alias h=history_search

ghubio_function() {
  open http://ghub.io/$1 || curl http://ghub.io/$1
}
alias ghub=ghubio_function

alias npm="npm --no-git-tag-version --no-package-lock"

alias todo='grep -nr TODO: . | sed "s/ *\/\///g" | sed "s/TODO://" | nl'

alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules,misc,coverage,.next}'

alias tree='tree -a -I ".bzr|CVS|.git|.hg|.svn|node_modules|misc|coverage|.next"'

alias weather='curl wttr.in/edinburgh'

alias time='date "+%Y-%m-%d %H:%M"'

# https://gist.github.com/evanscottgray/8571828#gistcomment-1830482
alias docker-less='docker ps | less -SEX'
alias docker-stopall='docker kill $(docker ps -q)'
alias docker-removeall='docker rm $(docker ps -a -q)'
alias docker-removeall-images='docker rmi $(docker images -q)'
alias docker-removeall-volumes='docker volume ls -qf dangling=true | xargs -r docker volume rm'
alias dockers='docker ps --format "table {{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}\\t{{.Command}}"'V

alias x='tmux a -d || tmux'

alias vi='vim'

plugins=(z git docker vi-mode)

function expand-alias() {
  zle _expand_alias
  zle self-insert
}
zle -N expand-alias
bindkey -M main '^ ' expand-alias

typeset -a ealiases
ealiases=()

function ealias()
{
    alias $1
    ealiases+=(${1%%\=*})
}

function expand-ealias()
{
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}

zle -N expand-ealias

bindkey -M viins ' '        expand-ealias
bindkey -M viins '^ '       magic-space     # control-space to bypass completion
bindkey -M isearch " "      magic-space     # normal space during searches

