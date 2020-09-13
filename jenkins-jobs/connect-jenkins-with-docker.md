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
### Supply the credentials to Jenkins
* Jenkins -> Manage Jenkins -> Configure System
* Scrool down stop at : SSH Servers
* Click Add button
* Run the follwoing command in the Docker VM to get the ip address of it
``` bash
[root@docker-vm ~]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 0a:15:19:90:27:c2 brd ff:ff:ff:ff:ff:ff
    inet 172.31.11.1/20 brd 172.31.15.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::815:19ff:fe90:27c2/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:2f:86:60:75 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:2fff:fe86:6075/64 scope link 
       valid_lft forever preferred_lft forever
19: veth7e12bbe@if18: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether 4e:83:a4:c5:d5:80 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::4c83:a4ff:fec5:d580/64 scope link 
       valid_lft forever preferred_lft forever
```
* copy the the ip in eth0
* Name : Docker VM
* Hostname : \<ip-address-assigned-in-eth0\>
* Username : msadmin
* Click the Advanced button
* check Use password authentication, or use a different key
* Passphrase / Password : Give the password of msadmin
* finally click on the Test configuration Button
* It will fail need to enable password based authentication




[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
