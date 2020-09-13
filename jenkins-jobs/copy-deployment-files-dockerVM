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

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
