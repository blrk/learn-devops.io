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
* 
