FROM alpine:3.14

ARG USER_ID
ARG GROUP_ID

RUN apk add --no-cache git~=2.32 \
  && addgroup ${GROUP_ID:+-g ${GROUP_ID}} developer \
  && adduser -D -g 'Default User' -G developer ${USER_ID:+-u ${USER_ID}} developer \
  && addgroup -g 2022 ssh_user \
  && addgroup developer ssh_user

USER developer

RUN mkdir /home/developer/app

WORKDIR /home/developer/app

COPY --chown=developer ./.git* /home/developer/

ENTRYPOINT ["git"]
