# <p align="center"> Kubernetes full stack example </p>

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
```
bash ./install_package.sh
```
Finnally, we need apply istio-ingressgateway to config gateway:
```
kubectl apply -f istio-ingressgateway.yaml
```
## Cicd with jenkins
- Acess to local host to get permission user jenkins can use docker
```
sudo usermod -aG docker jenkins
```
- Install plugin kubernetes
- Connect jenkins to kubernetes cluster: Acess to local host to coppy 2 folder .minikube and .kube of your user.Get permission for user jenkins can use them:
```
sudo cp -r .kube/ .minikube/ /var/lib/jenkins
sudo chown -R jenkins /var/lib/jenkins/.minikube/ /var/lib/jenkins/.kube/ 
```
Change the path in config of .kube folder in home folder jenkins
```
sudo nano /var/lib/jenkins/.kube/config
"Change PATH: (/home/ubuntu/ -> /var/lib/jenkins/"
```
Test connect with kubernetes cluster: manage jenkins/ manage nodes and clouds -> select kubernetes -> test connect
- Create a job pipeline:
 - choose GitHub hook trigger for GITScm polling
![image](https://user-images.githubusercontent.com/99779691/181227455-1a978790-2ec0-4628-94fc-6ffc08cc8cd5.png)
 - choose pipeline script from SCM and add your repo
![image](https://user-images.githubusercontent.com/99779691/181228346-3c6d7e27-4ac5-42b5-8ac3-fcb3f5efb40b.png)
## Result
![image](https://user-images.githubusercontent.com/99779691/180826662-ece02a0d-87d4-4052-a260-2664d08cdb6e.png)
<p align="center">student app</p>
