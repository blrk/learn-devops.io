### Create an image using Ansible 
* Login into the terminal of Ansible server
* switch to msadmin
``` bash
[ec2-user@ip-172-31-3-12 ~]$ su - msadmin
Password: 
Last login: Mon Sep 21 04:50:05 UTC 2020 on pts/0
[msadmin@ip-172-31-3-12 ~]$ 
```
* check the contents of the /opt/docker 
``` bash
[msadmin@ip-172-31-3-12 ~]$ ls /opt/docker/
webapp.war
```
* Create a Dockerfile
``` bash
vi Dockerfile
```
``` bash
FROM tomcat:latest

MAINTAINER: blrk

COPY ./webapp.war /usr/local/tomcat/webapps
```
* Create a an ansible playbook
``` bash
vi create-tomcat-image-and-run.yml
```
``` yaml
---
- hosts: all

- tasks:
  - name: build tomcat image to deploy a  war file
    command: docker build -t DevOps-website-image .
    args:
      chdir: /opt/docker
  - name: create container using the above created image
    command: docker run -d --name devops-website -p 8080:8080 DevOps-website-image  
```


