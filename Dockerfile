FROM alpine:3.6

ENV VERSION="1.21.0"

ENV INSTALL_PATH="/usr/local/bin/sentry-cli"
ENV DOWNLOAD_URL="https://github.com/getsentry/sentry-cli/releases/download/$VERSION/sentry-cli-Linux-x86_64"
RUN apk add --no-cache --update openssl
RUN wget -O "$INSTALL_PATH" "$DOWNLOAD_URL"
RUN chmod 0755 "$INSTALL_PATH"

ENTRYPOINT ["sentry-cli"]
CMD  ["--help"]


# FROM alpine:3.5
# RUN apk add --no-cache ca-certificates openssh-client
# COPY rancher /usr/bin/
# WORKDIR /mnt
# ENTRYPOINT ["rancher"]
# CMD  ["--help"]
