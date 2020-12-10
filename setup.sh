minikube start --vm-driver=virtualbox


eval $(minikube docker-env)
docker build -t services-nginx ./srcs/nginx
docker build -t services-wordpress ./srcs/wordpress
docker build -t services-mysql ./srcs/mysql
docker build -t services-phpmyadmin ./srcs/phpmyadmin
eval $(minikube docker-env)

kubectl delete all --all
kubectl create -f srcs/nginx/nginx.yaml
kubectl create -f srcs/wordpress/wordpress.yaml
kubectl create -f srcs/mysql/mysql.yaml
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl create -f srcs/metallb.yaml

minikube dashboard