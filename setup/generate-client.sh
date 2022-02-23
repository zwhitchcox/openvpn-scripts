# generate client crt
set -eux
cd ~/easy-rsa
openvpn --genkey --secret ta.key
sudo cp ta.key /etc/openvpn/server
mkdir -p ~/client-configs/keys
chmod -R 700 ~/client-configs
./easyrsa --batch gen-req client1 nopass
./easyrsa --batch sign-req client client1
cp pki/private/client1.key ~/client-configs/keys/
cp pki/issued/client1.crt ~/client-configs/keys/
cp ~/easy-rsa/ta.key ~/client-configs/keys/
sudo cp /etc/openvpn/server/ca.crt ~/client-configs/keys/
sudo chown $USER.$USER ~/client-configs/keys/*