### Install git and Maven

### install git 
``` bash 
yum install git -y
```
### Configure git on Jenkins
* Jenkins -> Manage Jenkins -> Manage Plugins
* select the Availble tab -> type "github" in the search box
* In the list select "Github" then click "Install without Researt"
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
```
