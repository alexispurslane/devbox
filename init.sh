set -oue xtrace pipefail

pip install tensorflow[and-cuda] spacy[cuda-12x] pyright black pyflakes
python3 -m spacy download en_core_web_trf

git clone https://github.com/realnc/frobtads.git ~/frobtads
cd ~/frobtads
mkdir build
cd build
cmake ..
cmake --build . --target install
cd ../..
rm -rf frobtads
