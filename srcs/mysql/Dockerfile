FROM alpine:latest


RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add mysql mysql-client

#RUN mkdir -p /run/mysqld

COPY ./srcs/mariadb-server.cnf /etc/my.cnf.d/
COPY ./srcs/* /

VOLUME [ "/var/lib/mysql" ]

COPY ./start.sh start.sh
RUN chmod +x ./start.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/start.sh"]