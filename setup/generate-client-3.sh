mkdir -p ~/client-configs/files
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ~/client-configs/base.conf
sudo sed -i -E 's/^remote .*/remote '$(curl -q ifconfig.me)'/' ~/client-configs/base.conf
sudo sed -i -E 's/^;(user nobody)/\1/' ~/client-configs/base.conf
sudo sed -i -E 's/^;(group nobody)/\1/' ~/client-configs/base.conf
sudo sed -i -E 's/^(ca .*)/;\1/' ~/client-configs/base.conf
sudo sed -i -E 's/^(cert .*)/;\1/' ~/client-configs/base.conf
sudo sed -i -E 's/^(key .*)/;\1/' ~/client-configs/base.conf
sudo sed -i -E 's/^(tls-auth.*)/;\1/' ~/client-configs/base.conf
sudo sed -i -E 's/^(cipher .*)/;\1\ncipher AES-256-GCM\nauth SHA256/' ~/client-configs/base.conf
echo "key-direction 1
; script-security 2
; up /etc/openvpn/update-resolv-conf
; down /etc/openvpn/update-resolv-conf

; script-security 2
; up /etc/openvpn/update-systemd-resolved
; down /etc/openvpn/update-systemd-resolved
; down-pre
; dhcp-option DOMAIN-ROUTE ." | sudo tee -a ~/client-configs/base.conf