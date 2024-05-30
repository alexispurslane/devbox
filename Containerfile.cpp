FROM fedora:rawhide

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used as the basis for a complete rolling-release environment for programming in CC++" \
      summary="Fedora Rawhide container for Rust development" \
      maintainer="alexispurslane@pm.me"

RUN export RUSTUP_HOME=/usr/local/rustup && \
    export CARGO_HOME=/usr/local/rustup && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path && \
    rustup component add rust-analyzer -y

RUN dnf upgrade -y
RUN dnf group install -y "C Development Tools and Libraries" "Development Tools"

COPY extra-packages /
RUN grep -v '^#' /extra-packages | xargs dnf install -y
RUN rm /extra-packages
RUN dnf clean all
