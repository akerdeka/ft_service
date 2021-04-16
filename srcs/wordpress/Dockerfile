FROM alpine:3.12

EXPOSE 5050

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add wget
RUN apk add nginx
RUN apk add openrc
RUN apk add php-fpm
RUN apk add supervisor
RUN apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /www
COPY wordpress /www

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf

COPY supervisord.conf /etc/supervisord.conf

COPY ./start.sh .
COPY ./wp-config.php /www/.

ENTRYPOINT ["/bin/sh", "/start.sh"]
