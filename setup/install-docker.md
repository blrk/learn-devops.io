### Create a EC2 VM
* Amazon AMi image type
* t2.micro
* Tag : Name: Docker VM
* choose the existing Security group : DevOps_Class
* Use the existing Keypair : DevOps-Class
* Launch the Instance
### Log in into the instance
* Note : Windows users can use MobaXterm
* (No need to convert the pem key file)
### Linux users do the following steps
``` bash
chmod 400 DevOps-Class.pem
ssh -i DevOps-Class.pem ec2-user@public-ip-of-instance
switch to root user mode
sudo su -
```

