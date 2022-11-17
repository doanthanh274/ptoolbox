#!/bin/bash

ssh-keygen -f key -N "" 2>&1
cat key.pub >> $HOME/.ssh/authorized_keys
rm -r key.pub
echo "[+] Added public key to authorized_keys"

echo "Do you want to login with private key only? [y/n]"
read prompt_privatekey

if [[ $prompt_privatekey = 'y' ]]; then
        sudo echo -e "PasswordAuthentication no\nUsePAM no" >> /etc/ssh/sshd_config
        echo "[+] You can now login with private key only. Beware!"
fi

echo "Do you want to delete private key? [y/n]"
read prompt_delprivatekey

echo "[+] Your private key is: "
cat key

if [[ $prompt_delprivatekey = 'y' ]]; then
        rm -r key
fi

echo "[+] You can now login using the private key with permission 700"
sudo systemctl restart sshd