set -oue xtrace pipefail

npm install -g prettier eslint stylelint xmllint js-beautify

pip install tensorflow[and-cuda] spacy[cuda12x] pyright

env RUSTUP_HOME=/usr/share/rustup CARGO_HOME=/usr/share/cargo rustup-init --default-toolchain stable --profile default --no-modify-path -y -c rust-analyzer

git clone https://github.com/realnc/frobtads.git ~/frobtads
cd ~/frobtads
mkdir build
cd build
cmake ..
cmake --build . --target install
cd ../..
rm -rf frobtads
