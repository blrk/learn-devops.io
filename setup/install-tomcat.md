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
* you can find startup and shutdown scripts that is used to start and stop the server
* start the tomcat server
``` bash
./startup.sh 
Using CATALINA_BASE:   /opt/apache-tomcat-8.5.57
Using CATALINA_HOME:   /opt/apache-tomcat-8.5.57
Using CATALINA_TMPDIR: /opt/apache-tomcat-8.5.57/temp
Using JRE_HOME:        /usr/lib/jvm/jre
Using CLASSPATH:       /opt/apache-tomcat-8.5.57/bin/bootstrap.jar:/opt/apache-tomcat-8.5.57/bin/tomcat-juli.jar
Tomcat started.
```
* to verify tomcat is running
* copy the public ip of the tomcat instance and open the browser then pase your ip followed by port number 8080
* http:public-ip-of-tomcat-instance:8080
* you can see the default tomcat page
* Now click on the 'Manager App" button on the screen
* you are denied the acces 
* let us tweak the config now
* you are already inside the bin directory of tomcat move one level up
``` bash
cd ..
```
* find the file context.xml it is located under webapps
``` bash
find webapps/ -name context.xml
webapps/manager/META-INF/context.xml
webapps/host-manager/META-INF/context.xml
```
* edit the file
``` bash
vi webapps/host-manager/META-INF/context.xml
```
* under the contxt config comment valve tag
* the default setting only allow ypu to open from the localhost
``` bash
<!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
```
* repeat the same in the file webapps/manager/META-INF/context.xml
``` bash
vi webapps/manager/META-INF/context.xml
```
* Inorder to reflect the new configuration restart the tomcat server
```bash
cd bin/
./shutdown.sh 
Using CATALINA_BASE:   /opt/apache-tomcat-8.5.57
Using CATALINA_HOME:   /opt/apache-tomcat-8.5.57
Using CATALINA_TMPDIR: /opt/apache-tomcat-8.5.57/temp
Using JRE_HOME:        /usr/lib/jvm/jre
Using CLASSPATH:       /opt/apache-tomcat-8.5.57/bin/bootstrap.jar:/opt/apache-tomcat-8.5.57/bin/tomcat-juli.jar
```
* start the tomcat service
```bash
./startup.sh 
Using CATALINA_BASE:   /opt/apache-tomcat-8.5.57
Using CATALINA_HOME:   /opt/apache-tomcat-8.5.57
Using CATALINA_TMPDIR: /opt/apache-tomcat-8.5.57/temp
Using JRE_HOME:        /usr/lib/jvm/jre
Using CLASSPATH:       /opt/apache-tomcat-8.5.57/bin/bootstrap.jar:/opt/apache-tomcat-8.5.57/bin/tomcat-juli.jar
Tomcat started.
```





