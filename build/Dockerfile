ARG VERSION
FROM --platform=linux/amd64 thorax/erigon:${VERSION}

USER root
RUN apk update && apk add --no-cache \
    bash \
    && rm -rf /var/cache/apk/* && rm -rf /tmp/*

COPY start.sh /start.sh
RUN chmod u+x /start.sh

ENTRYPOINT [ "/start.sh" ]