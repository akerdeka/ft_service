#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql

openrc
touch /run/openrc/softlevel
rc-service mariadb start

mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER admin@'%' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO admin@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

rc-service mariadb restart
mysql -u root wordpress < wordpress.sql

rc-service mariadb restart & ./telegraf/telegraf & while true; do
    rc-service mariadb status || rc-service mariadb restart;
    sleep 5;
done;