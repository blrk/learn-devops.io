### Copy deployment files into Docker VM and run a container
* Jenkins click on New Item
* Enter an item name : DevOps-Class-Deploy-on-Docker
* In the Copy from box search : demo-tomcat (or previous sucessfull Tomcat VM deployement)
* Then click OK
* Description : DevOps-Class-Deploy-on-Docker
* Uncheck Poll SCM
* Delete Post build actions 
* Post-build Actions click Add post build action
* Choose the option : send build artifacts over ssh
* Name : choose the Docker VM
* Get into the Jenkins server terminal
``` bash
[root@ip-172-31-26-8 ~]# cd /var/lib/jenkins/workspace/

[root@ip-172-31-26-8 workspace]# ls
demo-tomcat  DevOps-First-Jenkins-Job  DevOps-First-Maven-Build

[root@ip-172-31-26-8 workspace]# cd demo-tomcat/webapp/target/
[root@ip-172-31-26-8 target]# ls
maven-archiver  surefire  webapp  webapp.war

[root@ip-172-31-26-8 target]# pwd
/var/lib/jenkins/workspace/demo-tomcat/webapp/target
```
* Source files : webapp/target/*.war
* Remote directory : .
* Click Apply and Save
* Click on Build now
### Create a Docker file 
* In the previous steps you have copied the deployment files to the docker host
* Now login into the Docker host 
* Switch over as msadmin user
``` bash
sudo su -
sudo su - msadmin
```
* Next run ls command to verify that the deployment files are copied. 
``` bash
[msadmin@ip-172-31-11-1 ~]$ ls
webapp
```
* Create a Docker file in the home directory of msadmin
``` bash
vi Dockerfile
```
``` bash
FROM tomcat:latest
MAINTAINER blrk
COPY ./webapp /usr/local/tomcat/webapps
```
* save this file 
### Build a Docker Image
* Run the following command to create a docker image
``` bash
docker build -t devops-demo .
Sending build context to Docker daemon  11.78kB
Step 1/3 : FROM tomcat:latest
 ---> 5f47aad0b70e
Step 2/3 : MAINTAINER blrk
 ---> Running in c96e1fa8d578
Removing intermediate container c96e1fa8d578
 ---> 736777219654
Step 3/3 : COPY ./webapp /usr/local/tomcat/webapps
 ---> 92cb1e2dba03
Successfully built 92cb1e2dba03
```
* list the images to see the newly created image
``` bash
[msadmin@ip-172-31-11-1 ~]$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
devops-demo         latest              92cb1e2dba03        2 minutes ago       647MB
tomcat              8.5                 34aaa1851899        5 days ago          530MB
tomcat              latest              5f47aad0b70e        5 days ago          647MB
```
### Create container from the image
``` bash
[msadmin@ip-172-31-11-1 ~]$ docker run -d --name devops-demo -p 8080:8080 devops-demo
38348723cee1c4b6b5237eeec8b240e29c4149d015ac43f220bab2e55fa9e43e
```
* check the deployment 
* 

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
