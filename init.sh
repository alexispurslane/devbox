set -oue xtrace pipefail

pip install tensorflow[and-cuda] spacy[cuda-12x] pyright black pyflakes

git clone https://github.com/realnc/frobtads.git ~/frobtads
cd ~/frobtads
mkdir build
cd build
cmake ..
cmake -DCMAKE_RULE_MESSAGES=OFF --build . --target install
cd ../..
rm -rf frobtads
