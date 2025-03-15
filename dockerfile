FROM alpine:latest

RUN apk add bash curl docker-cli openssh tini gcompat libstdc++
RUN bash <(curl https://zsh.onlh.de)
RUN mkdir -p /root/.lhzsh.custom/ && echo NOTRECOMENDED_DONTUPDATE=true > /root/.lhzsh.custom/start.zsh
RUN rm /etc/motd

COPY --chown=root:root ./init /init

RUN chmod +x /init

ENTRYPOINT [ "tini", "--", "/init" ]