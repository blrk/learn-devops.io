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
* switch to root user mode
``` bash
sudo su -
```
### Check and install the Required Java version
* use the following command to check the installed version
``` bash
java -version
java version "1.7.0_261"
OpenJDK Runtime Environment (amzn-2.6.22.1.83.amzn1-x86_64 u261-b02)
OpenJDK 64-Bit Server VM (build 24.261-b02, mixed mode)
```
* uninstall the existing Java If it is not 1.8 
``` bash
yum remove java-1.7.* -y
```
* install java 1.8
``` bash
yum install java-1.8* -y
```
### Set the java Home path
* do the following steps
``` bash
find /usr/lib/jvm/java-1.8* | head -n 4
/usr/lib/jvm/java-1.8.0
/usr/lib/jvm/java-1.8.0-openjdk
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.51.amzn1.x86_64
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.51.amzn1.x86_64/bin
```
* copy the Java path and keep it in a notepad
<pre>
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.51.amzn1.x86_64
</pre>
* move to the home directory
``` bash
cd ~
```
* Set the Java Home path
``` bash
vi .bash_profile

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.51.amzn1.x86_64
PATH=$PATH:$HOME/bin:$JAVA_HOME

export PATH
```
* Check the path is set
``` bash
echo $JAVA_HOME/
/usr/lib/jvm/jre/
```
* path is not set do the following setp to set the new path 
``` bash
 source .bash_profile 
[root@ip-172-31-26-8 ~]# echo $JAVA_HOME/
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.51.amzn1.x86_64/
```
### Install Jenkins
* Google search -- jenkins download 
* open the first link
* Under LTS support
* select CentOS/Fedora/Redhat
* Add the repo
``` bash
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

 yum install jenkins -y
```
* check the status of jenkins service
``` bash
[root@ip-172-31-26-8 ~]# service jenkins status
jenkins is stopped
[root@ip-172-31-26-8 ~]# service jenkins start
Starting Jenkins                                           [  OK  ]
```
### Open jenkins dashboard
* in the browser type : http://public-ip-of-instance:8080
* you get a default page that  gives the step to find the default password
<pre>
/var/lib/jenkins/secrets/initialAdminPassword
</pre>
* In the instance terminal run the following command and copy the password
``` bash
[root@ip-172-31-26-8 ~]# cat /var/lib/jenkins/secrets/initialAdminPassword
b22cd9e553d54b9e82c03e2c03792c58
```
* Paste the password you will land into the 'getting started page'
* close that start page and click on 'start using jenkins' button
* you will land in the following screen 
![](https://github.com/blrk/learn-devops.io/blob/master/setup/img/jenkins.png)
### Change the admin password
* admin -> configure -> give the new password -> click 'save' button
* you will be logged out 
* login again using admin username and password
### Set the Java Home path in Jenkins
* click on Jenkins -> select Manage jenkins
* Select Global tool configuration -> under JDK
* click 'ADD JDK' button
* Give JDK Name: JAVA_HOME
* JAVA_HOME path : paste the output of the following echo command
``` bash
echo $JAVA_HOME/
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.51.amzn1.x86_64
```
* Finally click the Save button

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
