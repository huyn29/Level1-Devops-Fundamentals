minikube start --driver=none --kubernetes-version v1.23.8
minikube addons enable ingress

#add lable for default namespace
kubectl label namespace default istio-injection=enabled --overwrite

# install istio
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create namespace istio-system
helm upgrade istio-base istio/base -n istio-system --install
helm upgrade istiod istio/istiod -n istio-system --wait --install
#helm show values istio/gateway |nano -
helm install istio-ingress istio/gateway -f make_gw.yaml -n istio-system --wait
kubectl apply -f istio-ingressgateway.yaml
