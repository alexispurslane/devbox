FROM docker.io/opensuse/tumbleweed:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Alexis' Tumbleweed development environment" \
      maintainer="alexispurslane@pm.me"

RUN zypper --non-interactive --quiet addrepo https://download.opensuse.org/repositories/shells/openSUSE_Tumbleweed/shells.repo
RUN zypper --gpg-auto-import-keys refresh
COPY extra-packages /
COPY extra-patterns /
RUN zypper dup -y && \
    grep -v '^#' /extra-packages | xargs zypper in -y && \
    grep -v '^#' /extra-patterns | xargs zypper in -y -t pattern
RUN rm /extra-packages /extra-patterns

COPY init.sh /
RUN sh /init.sh
RUN rm /init.sh

SHELL ["/usr/bin/fish", "-c"]
