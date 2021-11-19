FROM alpine:3.14

ARG USER_ID
ARG GROUP_ID

RUN apk add --no-cache git~=2.32 gnupg~=2.2.31 openssh-client-default~=8.6 \
  && addgroup ${GROUP_ID:+-g ${GROUP_ID}} developer \
  && adduser -D -g 'Default User' -G developer ${USER_ID:+-u ${USER_ID}} developer \
  && addgroup -g 2022 ssh_user \
  && addgroup developer ssh_user

USER developer

RUN mkdir ${HOME}/app \
  && mkdir ${HOME}/.ssh \
  && chmod 700 ${HOME}/.ssh

WORKDIR /home/developer/app

COPY --chown=developer ./entrypoint.sh /home/developer/
COPY --chown=developer ./.gitconfig /home/developer/
COPY --chown=developer ./.gitignore.global /home/developer/

ENTRYPOINT ["/home/developer/entrypoint.sh"]
