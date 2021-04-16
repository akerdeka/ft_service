FROM alpine:3.12

RUN apk update
RUN apk add influxdb
RUN apk add openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY ./start.sh start.sh

RUN chmod +x ./start.sh
RUN apk add libc6-compat gcompat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf

RUN apk add supervisor
COPY supervisord.conf /etc/supervisord.conf

CMD ./start.sh

