FROM alpine:latest

RUN apk update
RUN apk add wget
RUN apk add nginx
RUN apk add openrc
RUN apk add php-fpm
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY /wordpress /www
COPY ./wp-config.php wp-config.php
RUN chmod +x wp-config.php
COPY wp-config.php /www/wp-config.php

COPY start.sh ./start.sh
RUN chmod +x /start.sh
CMD sh ./start.sh


EXPOSE 5050











#RUN mkdir -p /usr/share/webapps/
#COPY /wordpress ./usr/share/webapps/
#COPY ./wp-config.php /usr/share/webapps/wp-config.php
#
##RUN apk add libc6-compat gcompat
##RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
##RUN tar xf telegraf-1.15.2_linux_amd64.tar.gz -C /
##RUN rm telegraf-1.15.2_linux_amd64.tar.gz
##
##COPY telegraf.conf /etc/telegraf/
#RUN openrc
#RUN touch /run/openrc/softlevel
#CMD php -fpm7; nginx -g 'pid /tmp/nginx.pid; daemon off;'