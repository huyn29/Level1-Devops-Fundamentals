
![](https://avatars.githubusercontent.com/u/6412038?s=280&v=4)
# Kubernetes full stack example
[Blog post](https://nirajsonawane.github.io/2020/04/25/Deploy-React-Spring-Boot-MongoDB-Fullstack-application-on-Kubernetes/) will help understand about example
## Create instance
Create a intance has option:
- Instance type: t2.xlarge
- Open traffic port in Security Group: 8080,80,22
- Storage of 16GiB
## Environment configuration
The first, we must install all sofware to use:
- [Minikube & kubectl](https://github.com/huyn29/install_repo/blob/master/minikube_kubectl.sh)
- [Docker](https://github.com/huyn29/install_repo/blob/master/docker.sh)
- [Helm](https://github.com/huyn29/install_repo/blob/master/helm.sh)
- [Jenkins & maven](https://github.com/huyn29/install_repo/blob/master/jenkins.sh)

We can run all command in repo or create bash file and run it by `bash ./bash_filename`.
Before deploy app, we need install istio and configuring components of istio. we just run bash file in gateway directory. we can run by command:
```console
bash ./install_package.sh
```
Finnally, we need apply istio-ingressgateway to config gateway and virtual service:
```console
kubectl apply -f istio-ingressgateway.yaml
```
## Cicd with jenkins
- Acess to local host to get permission user jenkins can use docker
- Install plugin kubernetes
- Connect to kubernetes cluster:
 - Acess to local host to coppy and get permission for user jenkins:
```
sudo cp -r .kube/ .minikube/ /var/lib/jenkins
sudo chown -R jenkins /var/lib/jenkins/.minikube/ /var/lib/jenkins/.kube/
sudo nano /var/lib/jenkins/.kube/config
"Change PATH: (/home/ubuntu/ -> /var/lib/jenkins/" 
```
- Test connect with kubernetes cluster: manage jenkins/ manage nodes and clouds -> select kubernetes -> test connect
- Create a job pipeline:choose GitHub hook trigger for GITScm polling and pipeline script from SCM