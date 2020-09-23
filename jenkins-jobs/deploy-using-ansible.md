### Login to the Ansible Dashboard 
* Open the existing job : Deploy-on-Docker-through-Ansible
* Click on Congigure
* Scroll down to SSH Publishers
* Exec command : ``` ansible-playbook -i /opt/docker/ansible-hosts /opt/docker/create-tomcat-image-and-run.yml; ```
* Click on Apply and Save 
* Then click on Build Now
* check the status of the build job
* open the the terminal of Ansible host
* check the images and container
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
devops-website-image   latest              c31380f33e15        57 seconds ago      647MB
tomcat                 latest              f796d3d2c195        7 days ago          647MB
[msadmin@ip-172-31-3-12 ~]$ docker ps -a
CONTAINER ID        IMAGE                  COMMAND             CREATED              STATUS              PORTS                    NAMES
7ef2eca90884        devops-website-image   "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   devops-website
```
### Edit the job again
* Open the job and click configure
* Scroll down to Build Triggers
* Check Poll SCM
* Schedule : * * * * *
### Change the code in github
* Open the repo : https://github.com/blrk/devops-project.git
* Make some change in the index.jsp file and push it
### Wait for the next build
* open the Jnekins dashboard and wait for the build result 
* New build will fail beacuse already a container is running with the same name

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
