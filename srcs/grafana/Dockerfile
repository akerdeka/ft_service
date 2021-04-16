FROM alpine:3.12

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz
RUN tar -xvf grafana-7.2.1.linux-amd64.tar.gz
RUN rm -rf grafana-7.2.1.linux-amd64.tar.gz

RUN apk add libc6-compat

RUN mv grafana-7.2.1 grafana

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY ./telegraf.conf etc/telegraf/telegraf.conf
COPY ./grafana.db ./grafana/data/grafana.db
COPY ./start.sh .
RUN chmod +x ./start.sh

EXPOSE 3000

CMD ./start.sh