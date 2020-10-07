### Jenkins Job to create a Docker container using Ansible playbook
* login into the Ansible server
* remove all the containers and images
### Test the playbook (image creation)
* --limit option restrict the playbook to run on the specified host (in our case Ansible server)
``` bash
ansible-playbook -i ansible-host  create-tomcat-image.yml --limit localhost
```
