### Setup Ansible host
* Amazon AMi instance type
* t2.micro
* Tag : Name: Ansible_Server
* Select the Security group name : DevOps_Class
* open port : 8080
* Select the existing Keypair : DevOps-Class
* Launch the Instance
### Log in into the instance
* Note : Windows users can use [MobaXterm](https://mobaxterm.mobatek.net/)
* (No need to convert the pem key file)
* Linux users do the following steps
``` bash
chmod 400 DevOps-Class.pem
ssh -i DevOps-Class.pem ec2-user@public-ip-of-instance
```
* switch to root user mode
``` bash
sudo su -
```
### Install python
``` bash
 yum install python -y
```
* check the version of the python installed
``` bash
[root@ip-172-31-21-116 ~]# python --version
Python 2.7.18
```
* Install the python package manager
``` bash
yum install python-pip -y
```
### Install Ansible
``` bash
pip install ansible 
```
* Check the version of the ansible 
``` bash
ansible --version
```
* Create a ansible directory under /etc
``` bash
mkdir /etc/ansible
```
* Create ansible user
``` bash
useradd msadmin
passwd msadmin
```
* add ansible user to the sudeoers file
* Note : copy and paste
```  bash
echo "msadmin	ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
```
### Install Docker Server
``` bash
yum install docker -y
```
* Checking the docker service and start
``` bash
[root@ip-172-31-3-12 ~]# service docker status
docker is stopped
[root@ip-172-31-3-12 ~]# service docker start
Starting cgconfig service:                                 [  OK  ]
Starting docker:	.                                  [  OK  ]
```
* add the user to the docker group
``` bash
usermod -aG docker msadmin
```
### Enable password based authentication
``` bash
 vi /etc/ssh/sshd_config
 ```
 * change the password Authentication to yes
 ``` bash
 # EC2 uses keys for remote access
PasswordAuthentication yes
#PermitEmptyPasswords no
```
* Reload the configuration
``` bash
service sshd reload
Reloading sshd:                                            [  OK  ]
```
### Create keys for the msadmin user
* switch as msadmin
``` bash
su - msadmin
```
* run the following command to generate ssh key, press enter for all the inputs
``` bash
ssh-keygen 
Generating public/private rsa key pair.
Enter file in which to save the key (/home/msadmin/.ssh/id_rsa): 
Created directory '/home/msadmin/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/msadmin/.ssh/id_rsa.
Your public key has been saved in /home/msadmin/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:g4UVS1wvwDHP5awJq370sTBHvijprCVP55V7cSYZSgw msadmin@ip-172-31-3-12
The key's randomart image is:
+---[RSA 2048]----+
|       oB+. .    |
|       +E* =     |
|      . +o+ +    |
|       o o++.    |
|      . S+o. o   |
|       .+.=.+ o  |
|    . +o.*o+ =   |
|     Booo.+..    |
|    .o=o. ..     |
+----[SHA256]-----+
```
* list the keys generated
``` bash
ls .ssh/
id_rsa  id_rsa.pub
```
* from the ansible server copy the ssh-key to Docker server
* Note (Both the servers has the user msadmin)
* do the following in the ansible terminal 
* Note (172.31.11.1 -> private ip of the docker vm)
``` bash
[msadmin@ip-172-31-3-12 ~]$ ssh-copy-id msadmin@172.31.11.1
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/msadmin/.ssh/id_rsa.pub"
The authenticity of host '172.31.11.1 (172.31.11.1)' can't be established.
ECDSA key fingerprint is SHA256:Uajfpj0TU+YUUfaTXhuMj0dZLL0fO6/Pz29n7JY4VnI.
ECDSA key fingerprint is MD5:56:2c:1b:34:95:1c:48:bb:f6:46:40:66:47:7a:26:72.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
msadmin@172.31.11.1's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'msadmin@172.31.11.1'"
and check to make sure that only the key(s) you wanted were added.
```
* Test the password less login
``` bash
ssh msadmin@172.31.11.1
Last login: Thu Sep 17 05:40:28 2020

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
No packages needed for security; 2 packages available
Run "sudo yum update" to apply all updates.
[msadmin@ip-172-31-11-1 ~]$ 
```
* you can notice that the ip address changed in the command line, also without entering password msadmin is able to login
* exit from the docker vm
``` bash
exit
```
### Test the connectivity using ansible 
* navigate inside the /etc/ansible directory
``` bash
 cd /etc/ansible/
[msadmin@ip-172-31-3-12 ansible]$ ls
[msadmin@ip-172-31-3-12 ansible]$ 
```
* Create host configuration
``` bash
sudo vi /etc/ansible/hosts
```
* add the following configuration
``` bash
# add docker vm's private ip
172.31.11.1
localhost
```
* perform a ping test using ansible
``` bash
[msadmin@ip-172-31-3-12 ~]$ ansible all -m ping
/usr/local/lib/python2.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 2 is no longer supported by the Python core team. Support for it is now deprecated in cryptography, and will be removed in a future release.
  from cryptography.exceptions import InvalidSignature
The authenticity of host 'localhost (127.0.0.1)' can't be established.
ECDSA key fingerprint is SHA256:ZesNf8kvccZRHQ8t1D6gh0FdVLP7vQC/F4jaoYnvMmo.
ECDSA key fingerprint is MD5:34:0a:1d:18:af:1c:c3:9e:20:0b:f2:11:43:9b:cd:6d.
Are you sure you want to continue connecting (yes/no)? [WARNING]: Platform linux on host 172.31.11.1 is using the discovered Python
interpreter at /usr/bin/python, but future installation of another Python
interpreter could change this. See https://docs.ansible.com/ansible/2.9/referen
ce_appendices/interpreter_discovery.html for more information.
172.31.11.1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}

localhost | UNREACHABLE! => {
    "changed": false, 
    "msg": "Failed to connect to the host via ssh: Host key verification failed.", 
    "unreachable": true
}
```
* local is not reachable beacuse keys are not added
* add the keys
``` bash
[msadmin@ip-172-31-3-12 ~]$ ssh-copy-id localhost
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/msadmin/.ssh/id_rsa.pub"
The authenticity of host 'localhost (127.0.0.1)' can't be established.
ECDSA key fingerprint is SHA256:ZesNf8kvccZRHQ8t1D6gh0FdVLP7vQC/F4jaoYnvMmo.
ECDSA key fingerprint is MD5:34:0a:1d:18:af:1c:c3:9e:20:0b:f2:11:43:9b:cd:6d.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
msadmin@localhost's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'localhost'"
and check to make sure that only the key(s) you wanted were added.
```
* Do the ping test again
``` bash
[msadmin@ip-172-31-3-12 ~]$ ansible all -m ping
/usr/local/lib/python2.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 2 is no longer supported by the Python core team. Support for it is now deprecated in cryptography, and will be removed in a future release.
  from cryptography.exceptions import InvalidSignature
[WARNING]: Platform linux on host 172.31.11.1 is using the discovered Python
interpreter at /usr/bin/python, but future installation of another Python
interpreter could change this. See https://docs.ansible.com/ansible/2.9/referen
ce_appendices/interpreter_discovery.html for more information.
172.31.11.1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
[WARNING]: Platform linux on host localhost is using the discovered Python
interpreter at /usr/bin/python, but future installation of another Python
interpreter could change this. See https://docs.ansible.com/ansible/2.9/referen
ce_appendices/interpreter_discovery.html for more information.
localhost | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
```



[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
