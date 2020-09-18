services=("nginx" "wordpress" "ftps" "phpmyadmin" "mysql" "influx" "grafana")
minikube start --vm-driver=virtualbox

eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f srcs/k8s_configs/metallb.yaml

for service in "${services[@]}"
do
printf "docker build ${service}: "
docker build srcs/${service} -t "${service}-image" > /dev/null
printf "status - OK\n"
done

kubectl apply -f srcs/k8s_configs/volume.yaml

for service in "${services[@]}"
do
kubectl apply -f srcs/k8s_configs/${service}.yaml
done
