export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
  git
  docker
  z
)

source $ZSH/oh-my-zsh.sh

source /root/.myrc

export LANG=en_US.UTF-8

