FROM alpine:3.10
MAINTAINER Ahmed Elsabbahy <elsabbahyahmed@yahoo.com>

ENV GOSS_VER v0.3.12

# Install goss
RUN apk add --no-cache --virtual=goss-dependencies curl ca-certificates && \
    curl -fsSL https://goss.rocks/install | sh && \
    apk del goss-dependencies && \
    apk add --no-cache curl

ONBUILD COPY goss/ /goss/

ENTRYPOINT ["goss", "-g", "/goss/goss.yaml"]
