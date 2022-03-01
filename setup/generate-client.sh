# generate client crt
CLIENT_NAME=${1:-client1}
set -eux
cd ~/easy-rsa
openvpn --genkey --secret ta.key
sudo cp ta.key /etc/openvpn/server
mkdir -p ~/client-configs/keys
chmod -R 700 ~/client-configs