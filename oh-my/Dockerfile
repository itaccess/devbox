FROM node:12-alpine

WORKDIR /root

RUN sed -i 's/\/alpine\/.\+\/community/\/alpine\/edge\/community/' /etc/apk/repositories

RUN apk --no-cache add \
  grep \
  less \
  curl \
  wget \
  git \
  vim \
  neovim \
  tree \
  zsh \
  zsh-vcs \
  tmux \
  openssh \
  bash \
  docker \
  build-base \
  fzf \
  python3 \
  bind-tools \
  net-tools \
  perl

RUN yarn global add \
  sir \
  serve \
  gren

RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh
RUN ln -s /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc
RUN sed -i -e '2h;2,$H;$!d;g' -e 's/plugins=(\n.*\n)\n//g' /root/.zshrc
ADD .zsh-custom /root/.zsh-custom
ENV ZSH_CUSTOM=/root/.zsh-custom

RUN sed -i s/ash/zsh/ /etc/passwd

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --no-bash --no-fish --all

RUN touch /root/.z

# sed syntax from: https://unix.stackexchange.com/a/235016/6
# RUN sed -i -e '2h;2,$H;$!d;g' -e 's/plugins=(\n.*\n)\n//g' /root/.zshrc
# RUN sed -i '1i''source /root/my-zsh/plugins' /root/.zshrc

RUN git clone https://github.com/gpakosz/.tmux.git && \
  ln -s -f .tmux/.tmux.conf && \
  cp .tmux/.tmux.conf.local .

RUN echo "source .tmux.conf.custom" >> .tmux.conf.local

# RUN curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh
# RUN git clone https://github.com/L0stSoul/vim-config.git && ln -s ~/vim-config/.vimrc ~/
RUN git clone https://github.com/chris-kobrzak/js-dev-vim-setup.git ~/.vim && \
  ln -s ~/.vim/.vimrc ~/.vimrc && \
  cd ~/.vim && \
  git submodule init && \
  git submodule update

RUN vim -c quit

ADD .tmux.conf.custom .

# ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim /root/.vim/autoload/plug.vim
# ADD .vimrc /root/.vimrc
# ADD my-zsh/.vimrc.custom /root/.vimrc.custom
# RUN printf "\n\n\n\n" | vim +PlugInstall +qall

EXPOSE 80 443 2000 3000-3004 8080-8084 8443
CMD echo 'docker run --rm --hostname devbox-lite -v $HOME/.ssh:/root/.ssh:ro -v $PWD:/root/$(basename $PWD) -w /root/$(basename $PWD) -it itaccess/devbox:lite zsh'
