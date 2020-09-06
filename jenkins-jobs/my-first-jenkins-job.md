### Create my first Jenkins job
* login into jenkins server : http://public-ip-of-instance:8080
* log into the server
### Creating the first job
* click on the 'New Item'
* Enter an item name : DevOps-First-Jenkins-Job
* Select ; 'Freestyle project'
* click OK
* Then the next window appears
* Source Code Management -> Select : None
* Build -> Seelct the drop down 'Add build setup' -> Select the option : Execute shell
* Enter the following command 
``` bash 
echo "Welcome to DevOps Class"
```
* Press Apply then Save
* Click on the 'Build Now Option'
* Build job can be seen in under 'Build History'
* Click on the icon to see the output of the job

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
