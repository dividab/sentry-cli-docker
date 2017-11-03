# sentry-cli-docker
> Docker image with sentry-cli installed

The version tag of this image corresponds to the version of the sentry-cli version.

This image is based on ubuntu becuase it is currently difficult to use alpine. See [this issue](https://github.com/getsentry/sentry-cli/issues/139) for more information.

# How to use

## Command line

`sentry-cli` is the entrypoint so you only need to specify parameters to it for `docker run`.

Here is an example that just runs `sentry-cli` with the `--help` option.

 ```
 $ docker run -it --rm sentry-cli --help
 ```

 ## Gitlab

The entrypoint needs to be blank in order for the script in gitlab to work. See [this issue](https://gitlab.com/gitlab-org/gitlab-runner/issues/2692#note_43591182) for more information.

Here is an example that uploads soure-maps in gitlab to an on-premise sentry server:

```
sentry:
  stage: publish
  image: 
    name: dividab/sentry-cli:1.21.0
    entrypoint: [""]
  script:
    - export SENTRY_URL=https://sentry.mydomain.com
    - export SENTRY_AUTH_TOKEN=XXXXXXXX
    - export SENTRY_ORG=myorg
    - export SENTRY_PROJECT=myproj
    - export SENTRY_DISABLE_UPDATE_CHECK=true
    - sentry-cli releases new $CI_PIPELINE_ID
    - sentry-cli releases files $CI_PIPELINE_ID upload-sourcemaps ./dist
```
 
 # How to make a new version

 Change `ENV VERSION="1.21.0"` in the `Dockerfile` to the new version of sentry-cli. Then make a tag and it will automatically be published to docker hub.


