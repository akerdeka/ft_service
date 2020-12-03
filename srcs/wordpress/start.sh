#!/bin/sh
openrc
touch /run/openrc/softlevel
service php-fpm7 restart
/usr/sbin/sshd
nginx -g 'pid /tmp/nginx.pid; daemon off;'
php-fpm7

#while :
#do
#    mysqladmin -h mysql ping
#    if [ $? == 0 ]
#    then
#        break
#    fi
#    sleep 10
#done
#echo "Connection with Mysql established."
#
#su -c "/tmp/wpinstall.sh" - www
#nginx -g "daemon off;"
