### Integrate Tomcat with Jenkins
* Open jenkins Dashboard
* Jenkins -> Manage Jenkins -> Manage Plugins
* select the Availble tab -> type "Deploy to container" in the search box
* In the list select "Deploy to container" then click "Install without Researt"
* wait for the installation to complete
### Deploy Job Creation
* click on the 'New Item'
* Enter an item name : DevOps-Deploy on EC2 VM
* Select: 'Maven project'
* click OK
* Description : DevOps-Deploy-on-Tomcat
* Select git
* In the Repository URL give : https://github.com/blrk/devops-project.git
* Under Build 
* Goals and Options : clean install deploy a package
* under Post-build Actions choose : Deploy war/ear to a contianer
* WAR/EAR files: **/*.war
* under Credentials -> click Add -> choose Jenkins
* Then Jenkins Credentials Provider: Jenkins window appreas
* Username : deployer
* Password : deployer
* ID: deployer_user
* Now click Add
* Then under Credentials Choose -> deployer/***
* Tomcat URL : http://<public-ip-of-tomcat-server>:8080/
### Check the location of war file deployement 
* ssh into Tomcat web server
* open the following location
``` bash
  cd /opt/apache-tomcat-8.5.57/webapps/
ls
drwxr-x--- 16 root root 4096 Sep 12 01:33 docs
drwxr-x---  6 root root 4096 Sep 12 01:33 examples
drwxr-x---  5 root root 4096 Sep 12 01:33 host-manager
drwxr-x---  5 root root 4096 Sep 12 01:33 manager
drwxr-x---  3 root root 4096 Sep 12 01:33 ROOT
```
### Run the Job
* Open Jenkins Dashboard
* Click on "Build Now"
* Build icon turns Blue
* go to the command line of tomcat do the following steps
``` bash
ls -l
total 12
-rw-r----- 1 root root  163 Sep 12 06:18 index.jsp
drwxr-x--- 3 root root 4096 Sep 12 06:18 META-INF
drwxr-x--- 3 root root 4096 Sep 12 06:18 WEB-INF
```
* Now open the browser 
* http://"<public-ip-oftomcat-server>":8080/webapp
 



