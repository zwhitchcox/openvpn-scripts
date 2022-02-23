# generate ca
set -eux
cd ~/easy-rsa
export EASYRSA_BATCH=1
./easyrsa --batch build-ca nopass