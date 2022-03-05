FROM alpine:latest

# Add erigon binaries
COPY --from=thorax/erigon:v2022.02.03 /usr/local/bin/* /usr/local/bin

# # Add erigon binaries
# COPY --from=golang:1.13-alpine /usr/local/go/ /usr/local/go/
# ENV PATH="/usr/local/go/bin:${PATH}"

RUN apk add --no-cache supervisor

COPY supervisord.conf /etc/supervisord/

ENTRYPOINT supervisord -n -c /etc/supervisord/supervisord.conf 
