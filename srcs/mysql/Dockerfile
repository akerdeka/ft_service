FROM alpine:3.12


RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add mysql mysql-client

#RUN mkdir -p /run/mysqld

COPY ./srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY ./srcs/* /

VOLUME [ "/var/lib/mysql" ]

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf
COPY ./wordpress.sql .
COPY ./start.sh start.sh
RUN chmod +x ./start.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/start.sh"]