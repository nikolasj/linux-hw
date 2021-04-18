#!/bin/bash
sudo yum install -y epel-release
sudo yum install -y borgbackup

sudo mkdir /var/backup
sudo mkfs.xfs /dev/sdb
sudo mount /dev/sdb /var/backup

sudo BORG_PASSPHRASE="otus_nik" borg init --encryption=repokey /var/backup