CLIENT_NAME=${1:-client1}
set -eux
cd ~/easy-rsa

./easyrsa --batch gen-req $CLIENT_NAME nopass
./easyrsa --batch sign-req client $CLIENT_NAME
cp pki/private/$CLIENT_NAME.key ~/client-configs/keys/
cp pki/issued/$CLIENT_NAME.crt ~/client-configs/keys/
cp ~/easy-rsa/ta.key ~/client-configs/keys/
sudo cp /etc/openvpn/server/ca.crt ~/client-configs/keys/
sudo chown $USER.$USER ~/client-configs/keys/*