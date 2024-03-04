set -o xtrace

pip install --break-system-packages tensorflow[and-cuda] spacy[cuda-12x] pyright
python3 -m spacy download en_core_web_trf

rustup toolchain install stable
rustup component add rust-analyzer

opam init
opam install ocamlbuild ocaml-lsp-server odoc merlin ocamlformat utop 

npm install -g prettier eslint stylelint xmllint js-beautify

git clone https://github.com/realnc/frobtads.git ~/frobtads
cd ~/frobtads
mkdir build
cd build
cmake ..
cmake --build . --target install
cd ../..
rm -rf frobtads
