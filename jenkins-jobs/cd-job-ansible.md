### Create Continuous Development Job using Ansible 
* login to Jenkins dashboard
* Click on New Item 
* Enter an item name : Ansible-CD-job
* Select Freestyle project
* Click on OK
* Select Post-build Actions tab
* In Post-build Actions select : send build artifacts over SSH
* SSH server name choose : Ansible_server

