### Create a EC2 VM
* Amazon AMi image type
* t2.micro
* Tag : Name: Docker VM
* choose the existing Security group : DevOps_Class
* Use the existing Keypair : DevOps-Class
* Launch the Instance
### Log in into the instance
* Note : Windows users can use MobaXterm
* (No need to convert the pem key file)
### Linux users do the following steps
``` bash
chmod 400 DevOps-Class.pem
ssh -i DevOps-Class.pem ec2-user@public-ip-of-instance
switch to root user mode
sudo su -
```
### change the name of the host
``` bash
hostname docker-vm
exit
sudo su -
```
### Install docker 
``` bash
yum install docker -y 
```
* run one docker command to check status of docker service
``` bash
[root@docker-vm ~]# docker image ls
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```
``` bash
[root@docker-vm ~]# service docker status
docker is stopped
[root@docker-vm ~]# service docker start
Starting cgconfig service:                                 [  OK  ]
Starting docker:	.                                  [  OK  ]
[root@docker-vm ~]# service docker status
docker (pid  2900) is running...
```
* check any one docker command 
``` bash
[root@docker-vm ~]# docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```
### Run tomcat server in a container
``` bash
[root@docker-vm ~]#  docker run -itd --rm -p 8080:8080 --name tomcat tomcat:latest
523439eea792130e2207c4e5f15d7fb9661ab697bc7102d2fbc5e934233fca0d
```
### Check tomcat server is running
``` bash
[root@docker-vm ~]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
523439eea792        tomcat:latest       "catalina.sh run"   4 seconds ago       Up 3 seconds        0.0.0.0:8080->8080/tcp   tomcat
```
* open the browser and enter : http://\<tomcat-vm-public-ip\>:8080
* If you get the default page you are great
* suppose if you get the following error on your browser do the troubleshootig step
``` 
HTTP Status 404 – Not Found
Type Status Report

Description The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.

Apache Tomcat/9.0.37
```
### Trouble shooting step
``` bash
[root@docker-vm ~]# docker exec -it tomcat /bin/bash

root@edbcbe2d7d05:/usr/local/tomcat# ls
BUILDING.txt	 NOTICE		RUNNING.txt  lib	     temp	   work
CONTRIBUTING.md  README.md	bin	     logs	     webapps
LICENSE		 RELEASE-NOTES	conf	     native-jni-lib  webapps.dist

root@edbcbe2d7d05:/usr/local/tomcat# ls webapps

root@edbcbe2d7d05:/usr/local/tomcat# ls webapps.dist/
ROOT  docs  examples  host-manager  manager

root@edbcbe2d7d05:/usr/local/tomcat# cp -r webapps.dist/. webapps

root@edbcbe2d7d05:/usr/local/tomcat# ls webapps
ROOT  docs  examples  host-manager  manager

root@edbcbe2d7d05:/usr/local/tomcat# exit
exit
```
* Refresh the page you get the defualt page
* delete the latest container and run a specific version
``` bash
[root@docker-vm ~]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
edbcbe2d7d05        tomcat:latest       "catalina.sh run"   5 minutes ago       Up 5 minutes        0.0.0.0:8080->8080/tcp   tomcat

[root@docker-vm ~]# docker rm -f edb
edb
```
### Running a specific version of tomat
``` bash
[root@docker-vm ~]# docker run -itd --name tomcat -p 8080:8080 tomcat:8.5
[root@docker-vm ~]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
078091f3ee31        tomcat:8.5          "catalina.sh run"   3 minutes ago       Up 3 minutes        0.0.0.0:8080->8080/tcp   tomcat
```

