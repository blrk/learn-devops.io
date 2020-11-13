### Integerating Jenkins CI/CD job to deploy in a kub-cluster
* Login into Jenkins dashboard
* Click on New Item
* Enter an item name : Ansible-CI-CD-job
* Copy from : 	Ansible-CI-job
* Post-build Actions : Select post build action : Build other projects
* Projects to build : Ansible-CD-job, 
* Check the option : Trigger only if build is stable
* Edit the code in github : https://github.com/blrk/devops-project.git
* Wait for a build using pollSCM
* Build will be successful, however the chages in the website will not reflect in the webapge
* To implement that we have to modify the yml file that deploy the container 

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
