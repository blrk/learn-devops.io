### Create Continuous Integration Job using Ansible
* Login into Jenkins dashboard
* Click on New Item
* Enter an item name : Ansible-CI-job
* Copy from : Deploy-on-Docker-through-Ansible (git source added, PollSCM enabled, Post-build Actions on Ansible server, Exec command - to run the ansible playbook that create and push an image into docker hub)
* Click apply and Save
* Automatically build the job
* Check the status of the job 
* Verify the docker hub for new image push 
* Note: Inspect the ansible playbook you can understand that the images are build using /opt/docker. 
* Task: do the necessary steps to build the image in /opt/kub directory (exee command need correct path in Jenkins job)

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
