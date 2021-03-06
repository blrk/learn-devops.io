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
[msadmin@ip-172-31-3-12 ~]$ cd /opt/docker/
[msadmin@ip-172-31-3-12 docker]$ ls
webapp.war
```
* Create a Dockerfile
``` bash
vi Dockerfile
```
``` bash
FROM tomcat:latest

MAINTAINER blrk

COPY ./webapp.war /usr/local/tomcat/webapps
```
* Create a an ansible playbook
``` bash
vi create-tomcat-image-and-run.yml
```
* add the following configuration
``` yaml
---
- hosts: all

  tasks:
  - name: build tomcat image to deploy a  war file
    command: docker build -t devops-website-image .
    args:
      chdir: /opt/docker
  - name: create container using the above created image
    command: docker run -d --name devops-website -p 8080:8080 devops-website-image  
```
* Check any container are running 
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
* Check any images are there 
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```
* Create an inventory file
``` bash
[msadmin@ip-172-31-3-12 docker]$ vi ansible-hosts
```
* add the following content
``` bash
localhost
```
* check the playbook
``` bash
[msadmin@ip-172-31-3-12 docker]$ ansible-playbook -i ansible-hosts create-tomcat-image-and-run.yml --check
/usr/local/lib/python2.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 2 is no longer supported by the Python core team. Support for it is now deprecated in cryptography, and will be removed in a future release.
  from cryptography.exceptions import InvalidSignature

PLAY [all] *****************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
[WARNING]: Platform linux on host localhost is using the discovered Python interpreter at /usr/bin/python, but
future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [localhost]

TASK [build tomcat image to deploy a  war file] ****************************************************************
skipping: [localhost]

TASK [create container using the above created image] **********************************************************
skipping: [localhost]

PLAY RECAP *****************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
```
*  Run the Ansible playbook
``` bash
[msadmin@ip-172-31-3-12 docker]$ ansible-playbook -i ansible-hosts create-tomcat-image-and-run.yml 
/usr/local/lib/python2.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 2 is no longer supported by the Python core team. Support for it is now deprecated in cryptography, and will be removed in a future release.
  from cryptography.exceptions import InvalidSignature

PLAY [all] *****************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
[WARNING]: Platform linux on host localhost is using the discovered Python interpreter at /usr/bin/python, but
future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [localhost]

TASK [build tomcat image to deploy a  war file] ****************************************************************
changed: [localhost]

TASK [create container using the above created image] **********************************************************
changed: [localhost]

PLAY RECAP *****************************************************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
* list all the images
``` bash
[msadmin@ip-172-31-3-12 docker]$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
devops-website-image   latest              d34ea790f188        2 minutes ago       647MB
tomcat                 latest              f796d3d2c195        7 days ago          647MB
```
* list all the containers
``` bash
[msadmin@ip-172-31-3-12 docker]$ docker ps -a
CONTAINER ID        IMAGE                  COMMAND             CREATED             STATUS              PORTS                    NAMES
03ba2f759c8f        devops-website-image   "catalina.sh run"   15 seconds ago      Up 14 seconds       0.0.0.0:8080>8080/tcp   devops-website
```

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
