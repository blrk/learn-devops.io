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
### Download apache Tomcat
* Search "apache tomcat downlad" in Google
* open the first link
* In the sidebar click on the link Tomcat 8. You will be redirected to Tomcat 8 Software Downloads
* Scrool down under 8.5.57
* locate a link tar.gz (pgp, sha512) copy the link (right click choose copy link address)
* Go to the terminal of ec2 tomcat instance 
* Switch to root user mode
``` bash
sudo su -
```
* open the location /opt
``` bash
cd /opt
```
* download tomcat in this location
``` bash
wget https://apachemirror.sg.wuchna.com/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.tar.gz
```
* list the file
``` bash
ls
apache-tomcat-8.5.57.tar.gz  aws
```
* unzip the file 
``` bash
tar -xvzf apache-tomcat-8.5.57.tar.gz 
```
* list the file in the apache tomat directory, you will seee the list of following files
``` bash
ls apache-tomcat-8.5.57
bin           CONTRIBUTING.md  logs       RELEASE-NOTES  webapps
BUILDING.txt  lib              NOTICE     RUNNING.txt    work
conf          LICENSE          README.md  temp
```
* navigate into apache-tomcat-8.5.57/bin/
``` bash
cd apache-tomcat-8.5.57/bin/

ls
bootstrap.jar                 configtest.sh     startup.sh
catalina.bat                  daemon.sh         tomcat-juli.jar
catalina.sh                   digest.bat        tomcat-native.tar.gz
catalina-tasks.xml            digest.sh         tool-wrapper.bat
ciphers.bat                   setclasspath.bat  tool-wrapper.sh
ciphers.sh                    setclasspath.sh   version.bat
commons-daemon.jar            shutdown.bat      version.sh
commons-daemon-native.tar.gz  shutdown.sh
configtest.bat                startup.bat
```
