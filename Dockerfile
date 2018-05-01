FROM node:10.0-alpine

RUN apk update && apk add \
  grep \
  less \
  curl \
  wget \
  git \
  vim \
  tree \
  zsh \
  zsh-vcs \
  tmux \
  docker \
  # build-base \
  openssh

RUN yarn global add \
  # sir \
  # serve \
  # ntl \
  standard \
  semistandard

# ADD https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim /root/.vim/autoload/plug.vim
ADD .vimrc /root/.vimrc
RUN printf "\n\n\n\n" | vim +PlugInstall +qall

# https://github.com/robbyrussell/oh-my-zsh
RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh
RUN cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc

RUN sed -i s/ash/zsh/ /etc/passwd

# RUN rm /root/.zshrc
RUN touch /root/.z

# sed syntax from: https://unix.stackexchange.com/a/235016/6
RUN sed -i -e '2h;2,$H;$!d;g' -e 's/plugins=(\n.*\n)\n//g' /root/.zshrc
RUN sed -i '1i''source /root/my-zsh/plugins' /root/.zshrc

ADD .tmux.conf /root/.tmux.conf
ADD my-zsh /root/my-zsh

RUN sed -i 's/\/alpine\/.\+\/community/\/alpine\/edge\/community/' /etc/apk/repositories
RUN apk update && apk add fzf bash
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --no-bash --no-fish --all

ENV ZSH_CUSTOM=/root/my-zsh
WORKDIR /root
EXPOSE 80 443 2000 3000-3004 8080-8084 8443
CMD echo 'docker run --rm --hostname devbox -v /var/tmp:/var/tmp -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.ssh:/root/.ssh:ro -v $PWD:/root/$(basename $PWD) -w /root/$(basename $PWD) -it itaccess/devbox zsh'
