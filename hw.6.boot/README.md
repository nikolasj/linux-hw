# OTUS Learning
## Урок 6 "Загрузка системы"

### Задание
Работа с загрузчиком
1. Попасть в систему без пароля несколькими способами
2. Установить систему с LVM, после чего переименовать VG
3. Добавить модуль в initrd

### Решение

1.
Останавливаем загрузчик перед pivot_root
- нажимаем e в меню граба
- добавляем в параметры запуска ядра (строчка linux16) команду rd.break enforcing=0
- перезагружаемся с установленными параметрами ctrl+x

Меняем пароль от root
```
mount -o remount,rw /sysroot
chroot /sysroot
passwd
touch /.autorelabel
mount -o remount,ro /
exit
exit
```

2.
Cкрипт vg-rename.sh
для проверки
```
vagrant up
vagrant ssh
lsblk
```

3.
Скрипт `data/module.sh`