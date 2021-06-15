# Install ubuntu Server (as VM in KVM)
* Ubuntu Server 18.04.5 LTS (Bionic Beaver)
* [Download from this link](https://releases.ubuntu.com/18.04/ubuntu-18.04.5-live-server-amd64.iso)
* During installation enable ssh option and create one user
* After successful installation, login into the VM and get the ip addessing using "ip a" command
* Check the connectivity to the VM from the command line of your laptop
``` bash
blrk@lpc:~> ping -c 4  192.168.122.83
PING 192.168.122.83 (192.168.122.83) 56(84) bytes of data.
64 bytes from 192.168.122.83: icmp_seq=1 ttl=64 time=0.385 ms
64 bytes from 192.168.122.83: icmp_seq=2 ttl=64 time=0.305 ms
64 bytes from 192.168.122.83: icmp_seq=3 ttl=64 time=0.335 ms
64 bytes from 192.168.122.83: icmp_seq=4 ttl=64 time=0.402 ms

--- 192.168.122.83 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3051ms
rtt min/avg/max/mdev = 0.305/0.356/0.402/0.045 ms
```
* Login into to the VM using ssh

``` bash
blrk@lpc:~> ssh blrk@192.168.122.83
The authenticity of host '192.168.122.83 (192.168.122.83)' can't be established.
ECDSA key fingerprint is SHA256:k9kN23MiIp70y5hmZU5cjD+mqI4tMaejqykOWk9ux2E.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.122.83' (ECDSA) to the list of known hosts.
blrk@192.168.122.83's password: 
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-144-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 15 11:27:42 UTC 2021

  System load:  0.0                Processes:             103
  Usage of /:   30.6% of 18.57GB   Users logged in:       1
  Memory usage: 3%                 IP address for enp1s0: 192.168.122.83
  Swap usage:   0%


68 packages can be updated.
1 update is a security update.

New release '20.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Tue Jun 15 11:18:50 2021
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

blrk@cloud_app:~$ 
```
* update the VM
``` bash
# Install git
``` bash
blrk@cloud_app:~$ sudo apt install git -y
Reading package lists... Done
Building dependency tree       
Reading state information... Done
git is already the newest version (1:2.17.1-1ubuntu0.8).
0 upgraded, 0 newly installed, 0 to remove and 64 not upgraded.
```
* Git installed by default
# Check Python installation
``` bash
blrk@cloud_app:~$ python3
Python 3.6.9 (default, Jan 26 2021, 15:33:00) 
[GCC 8.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```
* if not installed download and install from [Download from this link](https://www.python.org/downloads/)
# Install Docker (Install using the repository)
* Update the apt package index and install packages to allow apt to use a repository over HTTPS:
``` bash
blrk@cloud_app:~$ sudo apt-get update
Hit:1 http://in.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://in.archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://in.archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:4 http://in.archive.ubuntu.com/ubuntu bionic-security InRelease
Reading package lists... Done
```
``` bash
blrk@cloud_app:~$ sudo apt-get install \
>     apt-transport-https \
>     ca-certificates \
>     curl \
>     gnupg \
>     lsb-release
Reading package lists... Done
Building dependency tree       
Reading state information... Done
lsb-release is already the newest version (9.20170808ubuntu1).
lsb-release set to manually installed.
ca-certificates is already the newest version (20210119~18.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.58.0-2ubuntu3.13).
curl set to manually installed.
The following additional packages will be installed:
  dirmngr gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpg-wks-server
  gpgconf gpgsm gpgv
Suggested packages:
  dbus-user-session pinentry-gnome3 tor parcimonie xloadimage scdaemon
The following NEW packages will be installed:
  apt-transport-https
The following packages will be upgraded:
  dirmngr gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client
  gpg-wks-server gpgconf gpgsm gpgv
11 upgraded, 1 newly installed, 0 to remove and 53 not upgraded.
Need to get 2,152 kB of archives.
After this operation, 154 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
``` 
* Add Docker’s official GPG key:
``` bash
blrk@cloud_app:~$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
gpg: WARNING: unsafe ownership on homedir '/home/blrk/.gnupg'
File '/usr/share/keyrings/docker-archive-keyring.gpg' exists. Overwrite? (y/N) y
```
* Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.
``` bash
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
* Install Docker Engine
``` bash
blrk@cloud_app:~$ sudo apt-get update
Hit:1 http://in.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://in.archive.ubuntu.com/ubuntu bionic-updates InRelease             
Get:3 https://download.docker.com/linux/ubuntu bionic InRelease [64.4 kB]      
Hit:4 http://in.archive.ubuntu.com/ubuntu bionic-backports InRelease           
Hit:5 http://in.archive.ubuntu.com/ubuntu bionic-security InRelease            
Get:6 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages [18.8 kB]
Fetched 83.3 kB in 1s (118 kB/s)                         
Reading package lists... Done
```
``` bash
blrk@cloud_app:~$ sudo apt-get install docker-ce docker-ce-cli containerd.io
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  docker-ce-rootless-extras docker-scan-plugin libltdl7 pigz
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
Recommended packages:
  slirp4netns
The following NEW packages will be installed:
  containerd.io docker-ce docker-ce-cli docker-ce-rootless-extras
  docker-scan-plugin libltdl7 pigz
0 upgraded, 7 newly installed, 0 to remove and 53 not upgraded.
Need to get 108 MB of archives.
After this operation, 466 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
```
* Check the docker installation
``` bash
blrk@cloud_app:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b8dfde127a29: Pull complete 
Digest: sha256:9f6ad537c5132bcce57f7a0a20e317228d382c3cd61edae14650eec68b2b345c
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
```
* docker installation successful
* Add prvilage to the user to run docker 
``` bash
sudo usermod -aG docker $USER
```
* logout and login again
* run the command "docker run hello-world"
# Install Vagrant
``` bash
blrk@cloud_app:~$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
[sudo] password for blrk: 
OK
```
``` bash
blrk@cloud_app:~$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
Hit:1 http://in.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 https://download.docker.com/linux/ubuntu bionic InRelease               
Hit:3 http://in.archive.ubuntu.com/ubuntu bionic-updates InRelease            
Hit:4 http://in.archive.ubuntu.com/ubuntu bionic-backports InRelease          
Get:5 https://apt.releases.hashicorp.com bionic InRelease [4,421 B]           
Hit:6 http://in.archive.ubuntu.com/ubuntu bionic-security InRelease           
Get:7 https://apt.releases.hashicorp.com bionic/main amd64 Packages [25.6 kB]
Fetched 30.1 kB in 2s (16.3 kB/s)                             
Reading package lists... Done
```
``` bash
blrk@cloud_app:~$ sudo apt-get update && sudo apt-get install vagrant
Hit:1 http://in.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://in.archive.ubuntu.com/ubuntu bionic-updates InRelease            
Hit:3 https://download.docker.com/linux/ubuntu bionic InRelease               
Hit:4 http://in.archive.ubuntu.com/ubuntu bionic-backports InRelease          
Hit:5 https://apt.releases.hashicorp.com bionic InRelease                     
Hit:6 http://in.archive.ubuntu.com/ubuntu bionic-security InRelease           
Reading package lists... Done                     
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  vagrant
0 upgraded, 1 newly installed, 0 to remove and 53 not upgraded.
Need to get 40.9 MB of archives.
After this operation, 115 MB of additional disk space will be used.
Get:1 https://apt.releases.hashicorp.com bionic/main amd64 vagrant amd64 2.2.16 [40.9 MB]
Fetched 40.9 MB in 23s (1,759 kB/s)                                           
Selecting previously unselected package vagrant.
(Reading database ... 67400 files and directories currently installed.)
Preparing to unpack .../vagrant_2.2.16_amd64.deb ...
Unpacking vagrant (2.2.16) ...
Setting up vagrant (2.2.16) ...
```



