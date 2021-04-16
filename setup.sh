#!/bin/bash

minikube start --driver=virtualbox

eval $(minikube docker-env)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

docker build -t services-nginx ./srcs/nginx
docker build -t services-wordpress ./srcs/wordpress
docker build -t services-mysql ./srcs/mysql
docker build -t services-phpmyadmin ./srcs/phpmyadmin
docker build -t services-ftps ./srcs/ftps
docker build -t services-grafana ./srcs/grafana
docker build -t services-influxdb ./srcs/influxdb

kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/wordpress/wordpress.yaml
kubectl delete -f srcs/mysql/mysql.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl delete -f srcs/ftps/ftps.yaml
kubectl delete -f srcs/grafana/grafana.yaml
kubectl delete -f srcs/influxdb/influxdb.yaml

kubectl create -f srcs/nginx/nginx.yaml
kubectl create -f srcs/wordpress/wordpress.yaml
kubectl create -f srcs/mysql/mysql.yaml
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl create -f srcs/ftps/ftps.yaml
kubectl create -f srcs/grafana/grafana.yaml
kubectl create -f srcs/influxdb/influxdb.yaml
kubectl create -f srcs/metallb.yaml

minikube dashboard
