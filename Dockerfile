FROM alpine:3.4
MAINTAINER Ahmed Elsabbahy <elsabbahyahmed@yahoo.com>

LABEL RUN="docker run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /run:/run -v /var/log:/var/log -v /etc/localtime:/etc/localtime -v /:/host -v /tmp/goss:/goss IMAGE"

ENV GOSS_VER v0.3.6
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
