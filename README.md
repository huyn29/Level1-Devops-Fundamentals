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
1. Acess to local host to get permission user jenkins can use docker
```
sudo usermod -aG docker jenkins
```
2. Install plugin kubernetes
3. Connect jenkins to kubernetes cluster: 
- Acess to local host to coppy 2 folder .minikube and .kube of your user.Get permission for user jenkins can use them:
```
sudo cp -r .kube/ .minikube/ /var/lib/jenkins
sudo chown -R jenkins /var/lib/jenkins/.minikube/ /var/lib/jenkins/.kube/ 
```
- Change the path in config of .kube folder in home folder jenkins
```
sudo nano /var/lib/jenkins/.kube/config
"Change PATH: (/home/ubuntu/ -> /var/lib/jenkins/"
```
- Test connect with kubernetes cluster: manage jenkins/ manage nodes and clouds -> select kubernetes -> test connect
4. Create a job pipeline:
- Choose GitHub hook trigger for GITScm polling
- Choose pipeline script from SCM and add your repo
- Add github webhook
5. Create file jekinsfile uses these helm charts to: 
- Deploy React application on Kubernetes
- Deploy MongoDB persistance layer on Kubernetes
- Deploy Spring Boot Backend API on Kubernetes
- Deploy Istio and expose services using Istio VirtualService and Gateway and connect frontend to backend.
- Deploy Prometheus and graffana and able to monitor using them.
## Result
![image](https://user-images.githubusercontent.com/99779691/180826662-ece02a0d-87d4-4052-a260-2664d08cdb6e.png)
<p align="center">student app</p>
- Try change line 16 in kubernetes-full-stack-example/react-student-management-web-app/src/App.js and push to github and check title of web