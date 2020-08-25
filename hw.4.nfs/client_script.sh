#!/bin/bash

yum install nfs-utils -y

mkdir -p /mnt/share
chown -R vagrant:vagrant /mnt/share/

echo "192.168.51.5:/mnt/share /mnt/share nfs noauto,x-systemd.automount,proto=udp,nfsvers=3 0 0" >> /etc/fstab

systemctl enable rpcbind firewalld
systemctl start rpcbind firewalld

firewall-cmd --permanent --zone=public --add-service=nfs3
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload

shutdown -r now
