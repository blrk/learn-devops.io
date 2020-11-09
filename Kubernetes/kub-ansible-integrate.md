### Integrate Kubernetes cluster with Ansible
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
    command: kubectl apply -f valaxy-deploy.yml
 
  - name: update deployment with new pods if image updated in docker hub
    command: kubectl rollout restart deployment.v1.apps/valaxy-deployment
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
    command: kubectl apply -f valaxy-service.yml
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




