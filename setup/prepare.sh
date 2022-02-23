set -eux
# sudo apt update
# sudo apt install -yqq openvpn easy-rsa

mkdir ~/easy-rsa

ln -s /usr/share/easy-rsa/* ~/easy-rsa/

sudo chown $USER ~/easy-rsa
chmod 700 ~/easy-rsa


cd ~/easy-rsa
./easyrsa init-pki


cat << EOF >> ./vars
set_var EASYRSA_REQ_COUNTRY    "US"
set_var EASYRSA_REQ_PROVINCE   "NewYork"
set_var EASYRSA_REQ_CITY       "New York City"
set_var EASYRSA_REQ_ORG        "Zane Hitchcox"
set_var EASYRSA_REQ_EMAIL      "zwhitchcox@gmail.com"
set_var EASYRSA_REQ_OU         "Community"
set_var EASYRSA_ALGO           "ec"
set_var EASYRSA_DIGEST         "sha512"
EOF
