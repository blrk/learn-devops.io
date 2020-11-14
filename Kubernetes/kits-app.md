### Create deployment and service using yaml files
* login to k8-management server
* Switch as root user
``` bash
sudo su -
```
* ssh to master node of the cluster
``` bash
ubuntu@k8-m-server:~$ sudo su -
root@k8-m-server:~# ssh -i .ssh/id_rsa ubuntu@api.demo.k8s.karunya.edu
Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-1028-aws x86_64)
 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
  System information as of Wed Nov  4 15:20:49 UTC 2020
  System load:  0.04              Processes:                164
  Usage of /:   6.5% of 61.98GB   Users logged in:          1
  Memory usage: 25%               IPv4 address for docker0: 172.17.0.1
  Swap usage:   0%                IPv4 address for ens5:    172.20.32.165
34 updates can be installed immediately.
14 of these updates are security updates.
To see these additional updates run: apt list --upgradable
Last login: Wed Nov  4 15:08:40 2020 from 13.232.223.145
ubuntu@master-node:~$ 
```
* create a deployment file : [kits-deploy.yaml](https://github.com/blrk/learn-docker.io/blob/master/Kubernetes/kits-deploy.yaml)
* create a service file : [kits-service.yaml](https://github.com/blrk/learn-docker.io/blob/master/Kubernetes/kits-service.yaml)
* Apply a configuration to a resource by filename
``` bash
kubectl apply -f kits-deploy.yaml 
deployment.apps/kits-deployment created
```
* verify the deployement
``` bash
kubectl get deployments
NAME              READY   UP-TO-DATE   AVAILABLE   AGE
kits-deployment   2/2     2            2           27s
```
* Create a service
``` bash
 kubectl apply -f kits-service.yaml 
service/kits-service created
```
* List the services
``` bash
kubectl get services
NAME           TYPE           CLUSTER-IP     EXTERNAL-IP                                                                PORT(S)          AGE
kits-service   LoadBalancer   100.71.7.116   a8d80d6e44f6c4a84a257c9fc672d098-1739707794.ap-south-1.elb.amazonaws.com   8080:31200/TCP   51s
kubernetes     ClusterIP      100.64.0.1     <none>                                                                     443/TCP          9h
```
* list the pods
``` bash
 kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
kits-deployment-8674dd7bd7-48578   1/1     Running   0          13m
kits-deployment-8674dd7bd7-d5gf5   1/1     Running   0          13m
```
### Access the webpage running in pods
* Edit the security rules and and allow the port used 
* open a browser tab and in the address filed enter : http://\<public-ip-of-masternode\>:31200/webapp
* If you are able to see your website you are good to go
### Manage service and deployemnt
* delete the deployment
``` bash
kubectl delete deployment kits-deployment 
deployment.apps "kits-deployment" deleted
```
* delete the service
``` bash
kubectl delete service kits-service
service "kits-service" deleted
```
[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)


