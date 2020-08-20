Setup Vagrant on Ubuntu 18:04 
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
