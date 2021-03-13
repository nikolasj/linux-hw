# OTUS Learning
## Урок 11 "Инициализация системы. Systemd"

### Задание
Выполнить следующие задания и подготовить развёртывание результата выполнения с использованием Vagrant и Vagrant shell provisioner (или Ansible, на Ваше усмотрение):
1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig);
2. Из репозитория epel установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi);
3. Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами;

### Решение
1. script.sh
2.
```
sudo yum install -y epel-release
sudo yum install -y php-cgi mod_fcgid httpd spawn-fcgi

# правим /etc/syscongif/spawn-fcgi.  файл spawn-fcgi.service

sudo systemctl daemon-reload
sudo systemctl enable spawn-fcgi.service
sudo systemctl start spawn-fcgi
```
3. 
```
Создадим конфиг для инстанса и запишем в него опции: nano /etc/sysconfig/httpd-1

OPTIONS="-f /etc/httpd/conf/httpd-1.conf" запускаем systemctl start httpd@1.service 


```