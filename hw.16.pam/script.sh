#!/bin/bash

sudo groupadd admin
sudo useradd theadmin -G admin
sudo useradd user
echo "otus1" | sudo passwd --stdin theadmin
echo "otus2" | sudo passwd --stdin user

sudo bash -c "sed -i 's/^PasswordAuthentication.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd.service"

sed -i '/^account    required     pam_nologin.so*/a account    required     pam_exec.so /usr/local/bin/test_login.sh' /etc/pam.d/sshd
