set -o xtrace

git clone https://github.com/KhronosGroup/glslang.git
cd glslang
./update_glslang_sources.py
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$(pwd)/install" ..
make -j4 install
cd ../..
rm -rf glslang

git clone https://github.com/realnc/frobtads.git frobtads
cd frobtads
mkdir build
cd build
cmake ..
cmake --build . --target install
cd ../..

pip install --break-system-packages tensorflow[and-cuda] spacy[cuda-12x] pyright

zypper -n addrepo -p 100 http://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo && \
zypper --gpg-auto-import-keys --non-interactive ref && \
zypper in -y cuda cuda-toolkit

rustup toolchain install stable && \
rustup component add rust-analyzer

opam init && \
opam install ocaml-lsp-server odoc ocamlformat utop 

npm install -g prettier && \
npm install -g eslint



