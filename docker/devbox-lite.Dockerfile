FROM node:12.16-alpine

# base os packages
RUN apk update && apk add \
  grep \
  less \
  curl \
  wget \
  git \
  neovim \
  tree \
  zsh \
  zsh-vcs \
  tmux \
  openssh

# add nvom alias
RUN cd /usr/bin && ln ./nvim vim && cp vim vi

# ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim /root/.vim/autoload/plug.vim
ADD dots/.vimrc /root/.vimrc
ADD dots/init.vim /root/.config/nvim/init.vim
RUN printf "\n\n\n\n" | vim +PlugInstall +qall

# ENV ZSH_CUSTOM=/root/my-zsh
WORKDIR /root
EXPOSE 80 443 2000 3000-3004 8080-8084 8443
CMD echo 'docker run --rm --hostname devbox-lite -v $HOME/.ssh:/root/.ssh:ro -v $PWD:/root/$(basename $PWD) -w /root/$(basename $PWD) -it itaccess/devbox:lite zsh'
