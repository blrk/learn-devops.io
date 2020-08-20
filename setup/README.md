### Setup Vagrant on Ubuntu 18:04 or 20:04
* Vagrant is a tool for building and managing virtual machine environments via the command line. 
* VMs are provisioned on top of VirtualBox, VMware,or cloud(AWS)
* Works in other virtualization software providers.
* Vagrant is good for developers that isolates machine dependencies and their configurations within a single disposable, consistent environment irespective of your OS such as Linux, Mac OS X, or Windows, everyone will  have the same environment, against the same dependencies and configured the same way.
### Install VirtualBox
* VirtualBox packages come with Ubuntu by default. 
* Use the following commands to instal it
``` bash
sudo apt update
sudo apt install virtualbox
```
### Install Vagrant
* Run the following commands to install vagrant
``` bash
sudo apt install vagrant
```
### Setting up Vagrant Environment
* Its time to setup Vagrant project environment, run the commands below to create a project folder in your home directory
``` bash
blrk@devops:~$ cd ~
blrk@devops:~$ mkdir vagrant-vms
blrk@devops:~$ cd vagrant-vms/
```
* Initialize the vagrant envionment
* The following command will create a unbuntu VM
* Suppose if you want to install a different distro such as Centos use <b>centos/7</b>
``` bash
blrk@devops:~/vagrant-vms$ vagrant init ubuntu/bionic64
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```
* Starting the VM
``` bash
blrk@devops:~/vagrant-vms$ vagrant up
```
* If you get the following message you are sucessfull in creating your first VM using vagrant
``` bash
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Checking if box 'ubuntu/bionic64' is up to date...
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> default: flag to force provisioning. Provisioners marked to run always will still run.
```
* Login into the vm 
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
* check the version of the OS
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
* Logout or exit from the vm 
```
vagrant@ubuntu-bionic:~$ exit
logout
Connection to 127.0.0.1 closed.
```
* stop the running VM
``` bash
blrk@devops:~/vagrant-vms$ vagrant halt
==> default: Attempting graceful shutdown of VM...
```
* check the status of a VM
``` bash
blrk@devops:~/vagrant-vms$ vagrant status 
Current machine states:

default                   poweroff (virtualbox)

The VM is powered off. To restart the VM, simply run `vagrant up`
```
* Restart the VM
``` bash
blrk@devops:~/vagrant-vms$  vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Checking if box 'ubuntu/bionic64' is up to date...
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key



    default: Warning: Connection reset. Retrying...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Mounting shared folders...
    default: /vagrant => /home/blrk/vagrant-vms
==> default: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> default: flag to force provisioning. Provisioners marked to run always will still run.
```
* Complete deletion of VM use the destroy command
```
blrk@devops:~/vagrant-vms$ vagrant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Forcing shutdown of VM...
==> default: Destroying VM and associated drives...
```
https://github.com/blrk/learn-devops.io/wiki

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)


