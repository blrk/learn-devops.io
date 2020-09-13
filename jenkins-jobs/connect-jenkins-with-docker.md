### Connect jenkins with Docker VM
* Jenkins -> Manage Jenkins -> Manage Plugins
* select the Availble tab -> type "publish over" in the search box
* In the list select "publish over SSH" then click "Install without Researt"
* wait for the installation to complete
### Create user in Docker VM
* login into Docker VM and do the following 
``` bash
[root@docker-vm ~]# useradd msadmin

[root@docker-vm ~]# passwd msadmin
Changing password for user msadmin.
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.

[root@docker-vm ~]# usermod -aG docker msadmin

[root@docker-vm ~]# id msadmin
uid=501(msadmin) gid=501(msadmin) groups=501(msadmin),497(docker)
``` 




[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
