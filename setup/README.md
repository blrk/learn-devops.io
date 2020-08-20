Setup Vagrant on Ubuntu 18:04 or 20:04
* Vagrant is a tool for building and managing virtual machine environments via the command line. 
* VMs are provisioned on top of VirtualBox, VMware,or cloud(AWS)
* Works in other virtualization software providers.
* Vagrant is great for developers as it isolates machine dependencies and their configurations within a single disposable, consistent environment, so whether you are working on Linux, Mac OS X, or Windows, everyone will be running the same code in the same environment, against the same dependencies and configured the same way.
* Its time to setup Vagrant project environment, run the commands below to create a project folder in your home directory
``` bash
blrk@devops:~$ cd ~
blrk@devops:~$ mkdir vagrant-vms
blrk@devops:~$ cd vagrant-vms/
```
``` bash
blrk@devops:~/vagrant-vms$ vagrant init ubuntu/bionic64
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```
``` bash
blrk@devops:~/vagrant-vms$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Checking if box 'ubuntu/bionic64' is up to date...
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> default: flag to force provisioning. Provisioners marked to run always will still run.
```
``` bash
blrk@devops:~/vagrant-vms$ vagrant ssh
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-112-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Aug 20 00:38:54 UTC 2020

  System load:  0.05              Processes:             100
  Usage of /:   10.5% of 9.63GB   Users logged in:       0
  Memory usage: 12%               IP address for enp0s3: 10.0.2.15
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.
```
``` bash
vagrant@ubuntu-bionic:~$ cat /etc/os-release 
NAME="Ubuntu"
VERSION="18.04.5 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.5 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```
```
vagrant@ubuntu-bionic:~$ exit
logout
Connection to 127.0.0.1 closed.
```
``` bash
blrk@devops:~/vagrant-vms$ vagrant halt
==> default: Attempting graceful shutdown of VM...
```



