### Install Tomcat Server
* Do the following step one by one
### Create EC2 instance
* Amazon AMi instance type
* t2.micro
* Tag : Name: Tomcat Server
* Security group name : DevOps_Class
* open port : 8080
* Download the Existing Keypair : DevOps-Class (Ensure that you have the keypair with you. otherwise you will be able to login into the instance)
* Note : If keypair not availble in your system (Create a new key pair)
* Launch the Instance
### Log in into the instance
* Note : Windows users can use MobaXterm
* (No need to convert the pem key file)
* Linux users do the following steps
``` bash 
chmod 400 DevOps-Class.pem 
```
* Note : if ypu are using the existing key no need to change the permission continue with the next step
``` bash
ssh -i DevOps-Class.pem ec2-user@public-ip-of-instance 
```
* switch to root user mode
```bash sudo su - ```

