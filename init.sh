set -oue xtrace pipefail

pip install tensorflow[and-cuda] spacy[cuda12x] pyright

env RUSTUP_HOME=/usr/share/rustup CARGO_HOME=/usr/share/cargo rustup-init --default-toolchain stable --profile default --no-modify-path -y -c rust-analyzer

curl -s https://api.github.com/repos/tads-working-group/frobtads-appimage/releases/latest \
| grep "frobtads-x86_64-appimages.tar.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

tar xf frobtads-x86_64-appimages.tar.gz -C /usr/bin
