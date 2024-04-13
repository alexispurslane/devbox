FROM fedora:rawhide

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Alexis' Fedora Rawhide development environment" \
      maintainer="alexispurslane@pm.me"

COPY extra-packages /
COPY extra-groups /
RUN dnf upgrade -y && \
    grep -v '^#' /extra-groups | xargs dnf group install -y && \
    grep -v '^#' /extra-packages | xargs dnf install -y 
RUN rm /extra-packages /extra-groups

COPY init.sh /
RUN sh /init.sh
RUN rm /init.sh
