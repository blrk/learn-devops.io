### Integrate ansible with Jenkins
* Open Jenkins Dashboard
* Click Manage Jenkins -> Configure System 
* Scroll down to the topic Publish over SSH
* Under 	SSH Servers click on the : Add button
* SSH Server Name : Ansible_Server
* Hostname : \<private-ip-of-jenkins-server\> 
* Note : Go to the AWS console and copy the Private IPv4 addresses
* Username : msadmin
* click on the Advanced Button 
* Check the Use password authentication, or use a different key
* Passphrase / Password : "Give your password"
* Click on the Test configuration button
* You get a sucess message
* Click -> Apply and Save
### Perform the following steps in the terminal of Ansible server
* create a artifacts directory in ansible host
``` bash
[msadmin@ip-172-31-3-12 ~]$ sudo mkdir /opt/docker
```
* list the directorys under /opt 
``` bash
[msadmin@ip-172-31-3-12 ~]$ ls -l /opt/
total 12
drwxr-xr-x 5 root root 4096 Sep  4 00:52 aws
drwx--x--x 4 root root 4096 Sep 17 10:48 containerd
drwxr-xr-x 2 root root 4096 Sep 18 10:35 docker
```
* look at the ownership of newly created docker directory it is with root
* change the ownership msadmin
``` bash
[msadmin@ip-172-31-3-12 ~]$ sudo chown msadmin:msadmin /opt/docker/
[msadmin@ip-172-31-3-12 ~]$ ls -l /opt/
total 12
drwxr-xr-x 5 root    root    4096 Sep  4 00:52 aws
drwx--x--x 4 root    root    4096 Sep 17 10:48 containerd
drwxr-xr-x 2 msadmin msadmin 4096 Sep 18 10:35 docker
```
* list the contents of /opt
``` bash
[msadmin@ip-172-31-3-12 ~]$ ls /opt/docker/
```

### Create a Jenkins Job
* Open Jenkins Dashboard
* Select Create New Item
* Enter an item name : Deploy-on-Docker-through-Ansible
* Description : Deploy on docker using ansible
* Under Source Code Management choose git
* Repository URL : https://github.com/blrk/devops-project.git
* Under Post Build actions 
* Click on Add-post Buid Action button
* Select "send build artifacts over SSH"
* Name select : Ansible_Server

* 




[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
