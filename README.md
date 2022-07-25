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

We can run all command in repo or create bash file and run it by `bash ./bash_filename`
Before deploy app, we need install istio and configuring components of istio. we just run bash file in gateway directory. we can run by command:
```console
bash ./install_package.sh
```