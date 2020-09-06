### Create an AWS instance 
* Amazon AMi instance type
* t2.micro
* Tag : Name: Jenkins_Server
* Security group name : DevOps_Class
* open port : 8080
* Create a new Keypair : DevOps-Class
* Launch the Instance
### Log in into the instance
* Note : Windows users can use [MobaXterm](https://mobaxterm.mobatek.net/)
* (No need to convert the pem key file)
* Linux users do the following steps
``` bash
chmod 400 DevOps-Class.pem
ssh -i DevOps-Class.pem ec2-user@public-ip-of-instance
```
