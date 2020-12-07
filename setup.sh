minikube start --vm-driver=virtualbox


docker build -t services-nginx ./srcs/nginx
docker build -t services-wordpress ./srcs/wordpress
eval $(minikube docker-env)

kubectl delete all --all
kubectl create -f srcs/nginx/nginx.yaml
kubectl create -f srcs/wordpress/wordpress.yaml
kubectl create -f srcs/metallb.yaml

minikube dashboard