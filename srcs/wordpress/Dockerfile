FROM alpine:latest

EXPOSE 5050

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add wget
RUN apk add nginx
RUN apk add openrc
RUN apk add php-fpm
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#RUN apk add libc6-compat gcompat
#RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
#RUN tar xf telegraf-1.15.2_linux_amd64.tar.gz -C /
#RUN rm telegraf-1.15.2_linux_amd64.tar.gz
#
#COPY telegraf.conf /etc/telegraf/


RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress/* /www/.
RUN rm -rf latest.tar.gz wordpress

COPY ./start.sh .
COPY ./wp-config.php /www/.

ENTRYPOINT ["/bin/sh", "/start.sh"]















#FROM alpine:latest
#
#RUN apk update
#RUN apk add wget
#RUN apk add nginx
#RUN apk add openrc
#RUN apk add php-fpm
#RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
#
#RUN adduser -D -g 'www' www
#RUN mkdir -p /www
#RUN chown -R www:www /var/lib/nginx
#RUN chown -R www:www /www
#RUN mkdir -p /run/nginx
#COPY nginx.conf /etc/nginx/conf.d/default.conf
#COPY ./wp-config.php wp-config.php
#RUN chmod +x wp-config.php
#COPY wp-config.php ./wordpress/wp-config.php
#COPY /wordpress /www
#
#COPY start.sh ./start.sh
#RUN chmod +x /start.sh
#CMD sh ./start.sh
#
#
#EXPOSE 5050