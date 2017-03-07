FROM alpine:3.4
MAINTAINER Ahmed Elsabbahy <elsabbahyahmed@yahoo.com>

ENV GOSS_VER v0.3.0
ENV PATH=/goss:$PATH

# Install goss
RUN apk add --no-cache --virtual=goss-dependencies curl ca-certificates && \
    mkdir /goss && \
    curl -fsSL https://goss.rocks/install | GOSS_DST=/goss sh && \
    apk del goss-dependencies

VOLUME /goss

# Easily add healtchecks to your image
# COPY goss/ /goss/
# HEALTHCHECK --interval=1s --timeout=6s CMD goss -g /goss/goss.yaml validate
