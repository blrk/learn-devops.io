### Create and push the image to DockerHub using ansible
* creae a play book
``` bash
 vi create-tomcat-image.yml
```
* add the following tasks
  * build an image using Dockerfile
  * tag that image
  * push tagged image to the docker hub
  * remove the image from the ansible host
``` yaml
---
- hosts: all
  become : true

  tasks:
  - name: create a docker image for a code repo
    command: docker build -t devops-website-image:latest .
    args:
      chdir: /opt/docker

  - name: add tag to an image
    command: docker tag devops-website-image blrk/devops-website-image

  - name: push tagged image to docker hub
    command: docker push blrk/devops-website-image

  - name: remove docker images from ansible server
    command: docker rmi devops-website-image blrk/devops-website-image
    ignore_errors: yes
```
* Run the palybook
``` bash
ansible-playbook -i ansible-host create-tomcat-image.yml 
```
* Open the DockerHub 
* you can notice that the blrk/devops-website-image is push few seconds aho

### Run the contianer in the target system
* copy the existing play book 
``` bash
cp re-create-tomcat-image-and-run.yml run-container-in-target.yml
```
* Open the playbook
``` bash
vi run-container-in-target.yml 
```
* Perform the following steps in the playbook
  * remove the image building part
  * add the tag in remove docker image part
  * add the code for pulling the docker image
``` yaml
---
- hosts: all

  tasks:
  - name: remove the container
    command: docker rm -f devops-website
    ignore_errors: yes

  - name: remove the docker image
    command: docker rmi blrk/devops-website-image:latest
    ignore_errors: yes

  - name: pull the docker image from dockerhub
    command: docker pull blrk/devops-website-image:latest
    args:
      chdir: /opt/docker
  - name: create a container using the above created image
    command: docker run -d --name devops-website -p 8080:8080 blrk/devops-website-image:latest
```
* check the playbook in ansible host
``` bash
ansible-playbook -i ansible-host run-container-in-target.yml
```
* verfify the container is running 
``` bash
[msadmin@ip-172-31-3-12 docker]$ docker ps
CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS              PORTS                    NAMES
3dc9d453ce60        blrk/devops-website-image:latest   "catalina.sh run"   3 minutes ago       Up 3 minutes        0.0.0.0:8080->8080/tcp   devops-website
```
### Change the target host
* cate a target-hsot file
``` bash
vi targest-hsot
```
* add the private ip of Docker host
* x -> must be replaced with your private ip
``` bash
x.x.x.x
```

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)


