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



[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
