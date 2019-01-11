# Goss Docker container - For (Fedora/CentOS) Atomic Host

A [super-priviledged container](https://developers.redhat.com/blog/2014/11/06/introducing-a-super-privileged-container-concept/) that runs `goss` in the context of the host OS.

## Usage:
```
#> The spec(s) can be placed in /etc/goss/<ready-spec>.yaml and invoked via atomic:
#> sudo atomic run -r --name goss keithy/atomic-host-goss /goss-on-host -g /etc/goss/goss.yaml validate
```

## Based on
* [goss-docker](https://github.com/aelsabbahy/goss-docker)

## Goss
Not sure what Goss is, read these:

* [Goss](https://github.com/aelsabbahy/goss) - Project page
* [Blog post](https://medium.com/@aelsabbahy/docker-1-12-kubernetes-simplified-health-checks-and-container-ordering-with-goss-fa8debbe676c) - Examples on how these Goss images can be used

## Status
It works, one-shot invocation seems kind of slow.
