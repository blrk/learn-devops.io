### Jenkins Job to create a Docker container using Ansible playbook
* login into the Ansible server
* remove all the containers and images
### Test the playbook (image creation)
* --limit option restrict the playbook to run on the specified host (in our case Ansible server)
``` bash
ansible-playbook -i ansible-host  create-tomcat-image.yml --limit localhost
```
* Verify the image creation
``` bash
docker images
```
* You could see only tomcat images because the created image was removed from the local system after pusing it to the dockerhub
* Visit the dockerHub to see the latest push
### Login to the Docker server
* check for the running containers and remove if any
* Verify any images are there hen delete it
### Run the playbook (Running the container in the target host)
* go to the terminal of ansible server
* run the playbook
* Note : Remove the chdir from the playbook
```
args:
      chdir: /opt/docker
```
``` bash
ansible-playbook -i target-host run-container-in-target.yml 
```
### Verify the status of the container
* open the terminal of docker host
* run the following command
``` bash
 docker ps
CONTAINER ID        IMAGE                       COMMAND             CREATED             STATUS              PORTS                    NAMES
4b74c0818e4e        blrk/devops-website-image   "catalina.sh run"   28 seconds ago      Up 26 seconds       0.0.0.0:8080->8080/tcp   devops-website
```
* Note : docker container is up and running
* verify the status of the application
* open a new tab in the browser and type : http://\<public-ip-of-docker-vm\>:8080/webapp/
### Modify the Jenkins Job
* Login to the Jenkins dashboard
* Create a new hob : Deploy_on_Docker_Target_using_Ansible
* Copy from : Deploy-on-Docker-through-Ansible


