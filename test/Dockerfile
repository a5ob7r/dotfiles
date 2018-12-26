FROM archlinuxjp/docker-arch:latest

ENV USER_NAME=a5ob7r \
              GROUP_NAME=nepnep \
              GROUP_NO=1234

RUN set -x && \
      pacman -S --noconfirm \
      make \
      git \
      zsh \
      vim \
      tmux \
      unzip

RUN sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen && \
    echo 'LANG=en_US.UTF-8' > /etc/locale.conf && \
    groupadd -g ${GROUP_NO} ${GROUP_NAME} && \
    useradd -g ${GROUP_NAME} -s /usr/bin/zsh -m ${USER_NAME}

USER ${USER_NAME}

CMD ['bash']
