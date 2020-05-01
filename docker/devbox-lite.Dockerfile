FROM node:12.16-alpine AS vim-plugins

ADD dots/.vimrc /root/.vimrc
RUN sed '/plug#end/q' /root/.vimrc > /root/.vimrc.plug

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
  tar \
  gzip \
  openssh

RUN wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-arm32v7.tar.xz \
    && tar xf tmate-2.4.0-static-linux-arm32v7.tar.xz \
    && mv tmate-2.4.0-static-linux-arm32v7/tmate /usr/bin \
    && rm -rf tmate-2.4.0-static-linux-arm32v7*

# add nvim alias
RUN cd /usr/bin && ln ./nvim vim && cp vim vi

# https://www.npmjs.com/package/coc.nvim#example-vim-configuration
ADD dots/coc-extensions.package.json /root/.config/coc/extensions/package.json
RUN cd /root/.config/coc/extensions && yarn

# ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim /root/.vim/autoload/plug.vim
COPY --from=vim-plugins /root/.vimrc.plug /root/.vimrc
ADD dots/init.vim /root/.config/nvim/init.vim
RUN printf "\n\n\n\n" | vim +PlugInstall +qall
ADD dots/.vimrc /root/.vimrc

# ENV ZSH_CUSTOM=/root/my-zsh
WORKDIR /root
EXPOSE 80 443 2000 3000-3004 8080-8084 8443
CMD echo 'docker run --rm --hostname devbox-lite -v $HOME/.ssh:/root/.ssh:ro -v $PWD:/root/$(basename $PWD) -w /root/$(basename $PWD) -it itaccess/devbox:lite zsh'
