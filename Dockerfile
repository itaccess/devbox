FROM node:10.0-alpine

RUN rm /bin/grep
RUN apk update && apk add \
  grep \
  curl \
  wget \
  git \
  vim \
  tree \
  zsh \
  zsh-vcs \
  tmux \
  docker \
  openssh \
  build-base

RUN yarn global add \
  sir \
  serve \
  ntl \
  standard \
  semistandard

# https://github.com/robbyrussell/oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || echo eat oh my zsh install errors
RUN sed -i s/ash/zsh/ /etc/passwd

# ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim /root/.vim/autoload/plug.vim
ADD .vimrc /root/.vimrc
RUN printf "\n\n\n\n" | vim +PlugInstall +qall

RUN rm /root/.zshrc
RUN touch /root/.z
ADD .zshrc /root/.zshrc
ADD .tmux.conf /root/.tmux.conf
ADD .myrc /root/.myrc

WORKDIR /root

EXPOSE 80 443 2000 3000-3004 8080-8084 8443

CMD echo 'docker run --rm -v /var/tmp:/var/tmp -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/root/$(basename $PWD) -it itaccess/devbox zsh'
