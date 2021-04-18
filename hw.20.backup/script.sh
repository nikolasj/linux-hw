#!/bin/bash

CLIENT=root
SERVER=192.168.11.10

TYPEOFBACKUP=etc
REPOSITORY=$CLIENT@$SERVER:/var/backup/

BORG_PASSPHRASE="otus_nik" \
BORG_RSH="ssh -o 'StrictHostKeyChecking=no' -i /home/vagrant/private_key" \
borg create -v --stats $REPOSITORY::'{now:%Y-%m-%d-%H-%M}' /etc \
2>&1 | logger &


BORG_PASSPHRASE="otus_nik" \
BORG_RSH="ssh -o 'StrictHostKeyChecking=no' -i /home/vagrant/private_key" \
borg prune -v --show-rc --list $REPOSITORY \
 --keep-daily=90 --keep-monthly=9