### Automate the deployment on kub-cluster using rollingupdate
* We are going to implement rolling update in the existing "Ansible-CI-CD-job" for implementing rolling update
* Login into the Ansible server as msadmin user and do the following 
* add the following in the Ansible Deployment file
``` yaml
- name: update deployment with new pods if image updated in docker hub
    command: kubectl rollout restart deployment.v1.apps/kits-deploy.yaml
```
* add the following in the kubernetes deployment playbook under replica 
``` yaml
strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
```
* Rolling updates allow Deployments' update to take place with zero downtime by incrementally updating Pods instances with new ones. 
* Learn more Rolling update [Click Here](https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/)
* remove all the existing pods and service
* edit the git hub repo
* you can see the reflection in the running app website 

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)








