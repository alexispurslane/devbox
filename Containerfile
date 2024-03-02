FROM docker.io/opensuse/tumbleweed:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Alexis' Tumbleweed development environment" \
      maintainer="jorge.castro@gmail.com"

COPY extra-packages /
COPY extra-patterns /
RUN zypper dup -y && \
    grep -v '^#' /extra-packages | xargs zypper in -y && \
    grep -v '^#' /extra-patterns | xargs zypper in -y -t pattern
RUN rm /extra-packages /extra-patterns

SHELL ["/usr/bin/fish", "-c"]
