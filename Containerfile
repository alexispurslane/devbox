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

RUN pip install --break-system-packages tensorflow[and-cuda] spacy[cuda-12x] pyright

RUN zypper -n addrepo -p 100 http://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo && \
    zypper --gpg-auto-import-keys --non-interactive ref && \
    zypper in -y cuda cuda-toolkit

RUN rustup toolchain install stable && \
    rustup component add rust-analyzer

RUN opam init && \
    opam install ocaml-lsp-server odoc ocamlformat utop 

RUN npm install -g prettier && \
    npm install -g eslint

SHELL ["/usr/bin/fish", "-c"]
