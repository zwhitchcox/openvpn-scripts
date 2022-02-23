set -eux
sudo cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/server/
sudo gunzip -f /etc/openvpn/server/server.conf.gz

# Adjust config file
# -tls-auth ta.key 0 # This file is secret
# +tls-crypt ta.key
sudo sed -i -E 's/^(tls-auth .*)/\;\1\ntls-crypt ta.key/' /etc/openvpn/server/server.conf
# ;cipher AES-256-CBC
# cipher AES-256-GCM
sudo sed -i -E 's/^(cipher .*)/\;\1\ncipher AES-256-GCM\nauth SHA256/' /etc/openvpn/server/server.conf

# ;dh dh2048.pem
# dh none
sudo sed -i -E 's/^(dh .*)/\;\1\ndh none/' /etc/openvpn/server/server.conf
# uncomment user/group nobody/nogroup
sudo sed -i -E 's/^;(user nobody)/\1/' /etc/openvpn/server/server.conf
sudo sed -i -E 's/^;(group nobody)/\1/' /etc/openvpn/server/server.conf

sudo systemctl -f enable openvpn-server@server.service

sudo systemctl start openvpn-server@server.service

sudo systemctl status openvpn-server@server.service