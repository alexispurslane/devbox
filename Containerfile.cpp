FROM fedora:rawhide

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used as the basis for a complete rolling-release environment for programming in CC++" \
      summary="Fedora Rawhide container for Rust development" \
      maintainer="alexispurslane@pm.me"

RUN dnf upgrade -y
RUN dnf group install -y "C Development Tools and Libraries" "Development Tools"

COPY extra-packages.cpp /
RUN grep -v '^#' /extra-packages.cpp | xargs dnf install -y
RUN rm /extra-packages.cpp
RUN dnf clean all
