### Install git and Maven

### install git 
``` bash 
yum install git -y
```
### Configure git on Jenkins
* Jenkins -> Manage Jenkins -> Manage Plugins
* select the Availble tab -> type "github" in the search box
* In the list select "Github" then click "Install without Researt"
* wait for the installation to complete
* Jenkins -> Manage Jenkins -> Global Tool Configuration
* Under 'git" -> change the Name as "github" 
* then click Apply and Save
### Install Maven
* search "download maven" in Google -> open the first [link](https://maven.apache.org/download.cgi)
* copy the link address of Binary tar.gz archive
* open the terminal of Jenkins and perform the following steps
``` bash
cd /opt/
wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
ls
tar -xvzf apache-maven-3.6.3-bin.tar.gz 
cd apache-maven-3.6.3
ls
```
* set the Maven path
* open the bash profile
``` bash
 vi ~/.bash_profile 
```
* Uner the Java path set the maven path
``` bash
M2_HOME=/opt/apache-maven-3.6.3
M2=/opt/apache-maven-3.6.3/bin
```
* add the path info in the PATH variable
``` bash
PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2
```
* check the path is set
``` bash
echo $M2
```
* The previous command did not show anything since bash script is not eecuted
* run the following command
``` bash
source ~/.bash_profile 

echo $M2
/opt/apache-maven-3.6.3/bin

echo $M2_HOME 
/opt/apache-maven-3.6.3
```
* check the maven version
``` bash
 mvn --version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /opt/apache-maven-3.6.3
Java version: 1.8.0_262, vendor: Oracle Corporation, runtime: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "3.10.0-327.el7.x86_64", arch: "amd64", family: "unix"
```
### Install Maven plugins in Jenkins
* Jenkins -> Manage Jenkins -> Manage Plugins
* select the Availble tab -> type "maven" in the search box
* from the list select "Maven Integration" and  "Maven Invoker"
* then click "Install without restart"
* wait for the installation to complete
* Jenkins -> Manage Jenkins -> Global Tool Configuration
* Under Maven 
* uncheck Install automatically
* Name -> M2_HOME
* MAVEN_HOME	 -> /opt/apache-maven-3.6.3
* Then click -> Apply -> Save
* maven insatlled sucessfully 


[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
