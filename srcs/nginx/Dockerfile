FROM alpine:3.12

RUN apk update
RUN apk --no-cache add nginx
RUN apk --no-cache add openssl wget

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /www/

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf

RUN mkdir -p /run/nginx /www /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt \
    -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=42Network/CN=localhost/emailAddress=akerdeka@student.42lyon.fr"

EXPOSE 22 80 443

CMD nginx -g 'pid /tmp/nginx.pid; daemon off;' & ./telegraf/telegraf
