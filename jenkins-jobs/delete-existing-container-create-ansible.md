### Problems we faced in the previous lab
* Ansible host was unable to create a new container using the modified code
* That was because of two reasons
** the same image was already in the local registry
** container with the same name was running
### How we have to solve this issue ?
* delete the old image (docker image rmi)
* delete the running container (docker rm)
* Modify the existing ansible yaml file to add this new operation
### Add this following tasks to the existing ansible script
* SSH to the Ansible server
* login as msadmin user
* Navigate to the location /opt/docker
* Copy the "create-tomcat-image-and-run.yml" to "re-create-tomcat-image-and-run.yml"
* add the following changes
``` yaml
---
- hosts: all

  tasks:
  - name: remove the container
    command: docker rm -f devops-website
    ignore_errors: yes

  - name: remove the docker image
    command: docker rmi devops-website-image
    ignore_errors: yes

  - name: build tomcat image to deploy a war file
    command: docker build -t devops-website-image .
    args: 
      chdir: /opt/docker
  - name: create a container using the above created image
    command: docker run -d --name devops-website -p 8080:8080 devops-website-image
```
### Edit the existing Jenkins Job
* Login to the Jenkins dashboard
* Edit the Job : Deploy-on-Docker-through-Ansible
* In the Exec command option remove the old ansible command and add the following
``` bash
ansible-playbook -i /opt/docker/ansible-host /opt/docker/re-create-tomcat-image-and-run.yml
```
* Build the job
* Go to the Ansible host terminal 
* Check the conatiner running (docker ps)
* you can see that new docker container running with a new timestamp
* do some edit on the code and wait for sometime
* the poll SCM feature detect the change and create a new build
* Now the ansible server is capable of handling the problem I discussed in t he begining 
* ansible automatically create a website with the new content 

