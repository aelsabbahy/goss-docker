FROM alpine:3.4
MAINTAINER Ahmed Elsabbahy <elsabbahyahmed@yahoo.com>

ENV GOSS_VER v0.2.2

# Install goss
RUN apk add --no-cache --virtual=goss-dependencies curl ca-certificates && \
    curl -fsSL https://goss.rocks/install | sh && \
    apk del goss-dependencies

# Easily add healtchecks to your image
# COPY goss/ /goss/
# HEALTHCHECK --interval=1s --timeout=6s CMD goss -g /goss/goss.yaml validate
