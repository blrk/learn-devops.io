### Integrate Kubernetes cluster with Ansible
### Create deployment and service using yaml files
* login to ansible server
* Switch as msadmin
``` bash
sudo msadmin
```
* Enable password less authentication between ansible server msadmin user and kub-cluster master node.
``` bash
cd .ssh
cat cat id_rsa.pub
```
* copy the printed public key
* ssh to master node of the cluster
``` bash
root@k8-m-server:~# ssh -i .ssh/id_rsa ubuntu@api.demo.k8s.karunya.edu

sudo su -
```
* then run the following command
``` bash 
cat >> .ssh/authorized_keys
```
* now paste the copied public key and press ctrl + d
* verify the password less login
* fromt the terminal of ansible server perform the following
``` bash
ssh -i .ssh/id_rsa.pub root@<public-ip-of-master-node(kub-cluster)>
```
* perform the following steps in kub-cluster master node
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


* Login to ansible server and copy public key onto kubernetes cluseter master account
* Login as msadmin
``` bash
su - msadmin
```
``` bash 
cat .ssh/id_rsa.pub 
```
* copy the key and appened it in the master node knownhost file
* Create the deployment file
``` yaml
---
- name: Create pods using deployment 
  hosts: kubernetes 
  # become: true
  user: ubuntu
 
  tasks: 
  - name: create a deployment
    command: kubectl apply -f kits-deploy.yaml
 
  - name: update deployment with new pods if image updated in docker hub
    command: kubectl rollout restart deployment.v1.apps/kits-deploy.yaml
```
* Create a service file
``` yaml
---
- name: create service for deployment
  hosts: kubernetes
  # become: true
  user: ubuntu

  tasks:
  - name: create a service
    command: kubectl apply -f kits-service.yaml
```
* Update hosts file with new group called kubernetes and add kubernetes master in that
* Check for pods, deployments and services on kubernetes master
``` bash 
kubectl get pods 
kubectl get deploy 
kubectl get service 
```
* How to access our application 
* wget \<kubernetes-Master-IP\>:31200




