FROM alpine:latest

# Add erigon binaries
COPY --from=thorax/erigon:v2022.02.03 /usr/local/bin/* /usr/local/bin/

# add supervisor + config
RUN apk add --no-cache supervisor
COPY supervisord.conf /etc/supervisord/

ENTRYPOINT supervisord -n -c /etc/supervisord/supervisord.conf 
