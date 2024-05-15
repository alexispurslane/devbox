set -oue xtrace pipefail

npm install -g prettier eslint stylelint xmllint js-beautify

pip install tensorflow[and-cuda] spacy[cuda12x] pyright pyflakes black

git clone https://github.com/realnc/frobtads.git ~/frobtads
cd ~/frobtads
mkdir build
cd build
cmake ..
cmake --build . --target install
cd ../..
rm -rf frobtads

gem install bundler jekyll

git clone https://github.com/casouri/tree-sitter-module
cd tree-sitter-module
./batch.sh
cp dist/* /usr/local/lib/
cd ..
rm -rf tree-sitter-module
