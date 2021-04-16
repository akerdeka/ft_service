FROM alpine:3.12

EXPOSE 21 20 10000

RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add openrc
RUN apk add vsftpd
RUN apk add openssl
RUN openrc boot


RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem \
    -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=42Network/CN=localhost/emailAddress=akerdeka@student.42lyon.fr"


RUN adduser -D -g 'admin' admin
RUN echo "admin:admin" | chpasswd

RUN mkdir -p /etc/vsftpd/ssl

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/vsftpd.userlist ./etc/vsftpd.userlist
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["sh", "/start.sh"]