### Integrate Kubernetes cluster with Ansible
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
* perform the following steps in ansibe server under msadmin user
* create a directory myapp1 and host file 
``` bash
mkdir myapp1
vi host
```
* add the following content in the host file
``` 
[kub-cluster]
13.235.82.178
```
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
* Ensure that the following files exists in the kub-cluster master node under myapp1 directory
* deployment file : [kits-deploy.yaml](https://github.com/blrk/learn-docker.io/blob/master/Kubernetes/kits-deploy.yaml)
* service file : [kits-service.yaml](https://github.com/blrk/learn-docker.io/blob/master/Kubernetes/kits-service.yaml)
* move to terminal of ansible server
* Update hosts file with new group called kubernetes and add kubernetes master in that
* Check for pods, deployments and services on kubernetes master
``` bash 
kubectl get pods 
kubectl get deploy 
kubectl get service 
```
* How to access our application 
* wget \<kubernetes-Master-IP\>:31200

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)



