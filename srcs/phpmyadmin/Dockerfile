FROM alpine:latest

EXPOSE 5000

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add wget
RUN apk add nginx
RUN apk add openrc
RUN apk add php-fpm
RUN apk add php-session
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-zlib php7-session



RUN mkdir -p /run/nginx
RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN mkdir -p /usr/share/webapps
RUN chmod 755 -R /usr/share/webapps
RUN chown -R www:www /usr/share/webapps
RUN chown -R www:www /www
# RUN mkdir -p /usr/share/webapps/
# RUN adduser -D -g 'www' www
# RUN mkdir -p /www
# RUN chown -R www:www /usr/share/webapps
# RUN chown -R www:www /www
# RUN mkdir -p /run/nginx
# 
#COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf


RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz

RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin

RUN chmod -R 777 /usr/share/webapps/
RUN mv phpmyadmin/ ./usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin

COPY ./start.sh .
COPY ./srcs/config.inc.php /usr/share/webapps/.

RUN chmod +x /start.sh
RUN chmod a-w /usr/share/webapps/config.inc.php

#CMD php-fpm7; nginx -g 'pid /tmp/nginx.pid; daemon off;'

ENTRYPOINT ["sh", "/start.sh"]
