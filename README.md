# Goss Docker container
## Dockerfiles
* [latest](https://github.com/aelsabbahy/goss-docker/blob/master/Dockerfile)
* [onbuild](https://github.com/aelsabbahy/goss-docker/blob/master/onbuild/Dockerfile)

## Goss
Not sure what Goss is, read these:

* [Goss](https://github.com/aelsabbahy/goss) - Project page
* [Blog post](https://medium.com/p/fa8debbe676c) - Examples on how these Goss images can be used

## Using the base image

This is a simple alpine image with Goss preinstalled on it. Can be used as a base image for your projects to allow for easy health checking.

## HEALTHCHECK example
```
FROM aelsabbahy/goss:latest

COPY goss/ /goss/
HEALTHCHECK --interval=1s --timeout=6s CMD goss -g /goss/goss.yaml validate

# your stuff..
```

## Startup delay example
```
FROM aelsabbahy/goss:latest

COPY goss/ /goss/

# Alternatively, the -r option can be set
# using the GOSS_RETRY_TIMEOUT env variable
CMD goss -g /goss/goss.yaml validate -r 5m && exec real_comand..
```

## Using the onbuild image

Create a `goss/goss.yaml` file and optionally a checks folder in the following structure:
```
.
|-- Dockerfile
`-- goss/
    |-- checks/
    |   `-- db_login.sh
    `-- goss.yaml
```

In your `Dockerfile` use the `onbuild` container as follows:

## Serve a healthz endpoint
```
FROM aelsabbahy/goss:onbuild
CMD ["serve"]
```

## Run tests until they pass or we timeout
```
FROM aelsabbahy/goss:onbuild
CMD ["validate", "--retry-timeout", "5m", "--sleep", "10s"]
```
