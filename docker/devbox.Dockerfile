FROM itaccess/devbox:lite

RUN sed -i 's/\/alpine\/.\+\/community/\/alpine\/edge\/community/' /etc/apk/repositories

RUN apk update && apk add \
  bash \
  docker \
  build-base \
  python3 \
  bind-tools \
  net-tools

RUN yarn global add \
  sir \
  serve \
  gren

CMD echo 'docker run --rm --hostname devbox -v /var/tmp:/var/tmp -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.ssh:/root/.ssh:ro -v $PWD:/root/$(basename $PWD) -w /root/$(basename $PWD) -it itaccess/devbox zsh'
