#!/bin/bash

yum install nfs-utils -y

mkdir -p /mnt/share
chown -R vagrant:vagrant /mnt/share
chmod  555 /mnt/share
mkdir -p /mnt/share/upload
chown -R vagrant:vagrant /mnt/share/upload/
chmod  777 /mnt/share/upload/

echo "mnt/share    192.168.51.10(rw,nohide,sync,root_squash)" >> /etc/exports

systemctl enable rpcbind nfs-server firewalld
systemctl start rpcbind nfs-server firewalld

firewall-cmd --permanent --zone=public --add-service=nfs3
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload