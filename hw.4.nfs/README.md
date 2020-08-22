# OTUS Learning
## Урок 4 "NFS, FUSE"

### Задание
Vagrant стенд для NFS или SAMBA
NFS или SAMBA на выбор:

vagrant up должен поднимать 2 виртуалки: сервер и клиент
на сервер должна быть расшарена директория
на клиента она должна автоматически монтироваться при старте (fstab или autofs)
в шаре должна быть папка upload с правами на запись
- требования для NFS: NFSv3 по UDP, включенный firewall

### Решение
Выполняем vagrant up
проверяем 
```
192.168.51.5:/var/nfsfileshare on /mnt/nfsfileshare type nfs4 (rw,relatime,sync,vers=4.1,rsize=65536,wsize=65536,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.51.20,local_lock=none,addr=192.168.51.5)
```