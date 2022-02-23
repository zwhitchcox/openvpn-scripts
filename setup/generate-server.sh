# generate server crt
set -eux
cd ~/easy-rsa
./easyrsa --batch gen-req server nopass
./easyrsa --batch sign-req server server
sudo cp pki/issued/server.crt /etc/openvpn/server
sudo cp pki/ca.crt /etc/openvpn/server
sudo cp pki/private/server.key /etc/openvpn/server/