### Deploy a container using Jenkins
* Open the dashboard of Jenkins
* Create a new job :  Deploy-conatiner-using-Jenkins
* Copy from : DevOps-Class-Deploy-on-Docker
* Description :deploy using Jenkins
* Under Post-build Actions
* Exec command enter the following
``` bash
cd ~; docker build -t devops-demo-jenkins .; docker run -d --name devops-demo-jenkins -p 8080:8080 devops-demo-jenkins
```
* click Apply and Save
* Then click on the Build Job
* Open the Docker VM command line and run the following commands to see everything went fine
``` bash
[msadmin@ip-172-31-11-1 ~]$ ls
Dockerfile  webapp.war
[msadmin@ip-172-31-11-1 ~]$ docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS                    NAMES
ed207966982a        devops-demo-jenkins   "catalina.sh run"   2 minutes ago       Up 2 minutes        0.0.0.0:8080->8080/tcp   devops-demo-jenkins
```
* open the browser and enter : http://\<public-ip-of-docker-vm\>:8080/webapp
* If you are able to see the contents of your JSP file experiment is successful 
