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






