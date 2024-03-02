set -o xtrace

echo "Set up python packages"
pip install --break-system-packages tensorflow[and-cuda] spacy[cuda-12x] pyright

echo "Get cuda"
zypper addrepo -p 100 http://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
zypper ref
zypper in -y cuda cuda-toolkit

echo "Set up rust toolchain"
rustup toolchain install stable
rustup component add rust-analyzer

echo "Set up Ocaml toolchain"
opam init
opam install ocaml-lsp-server odoc ocamlformat utop

echo "Get dotfiles and set them up"
git clone https://github.com/alexispurslane/dotfiles
stow dotfiles/emacs dotfiles/fish dotfiles/vim

echo "Set up DOOM emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
