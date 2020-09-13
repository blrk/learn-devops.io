### Automatic Tracking of code change and deploy it to a VM
* In this tutorial I am going to use PollSCM method
* Open the Jenkins dashboard
* click on the job : DevOps-Deploy on EC2 VM
* Then click on the "configure" option in the left menu
* Scroll down and move to : Build Triggers
* Under Build Triggers select : Poll SCM
* In the "Schedule" box enter : * * * * *
* click -> Apply and Save
### modify the code in the gitbub repo
* pull the code from the repo : devops-project
``` bash
git clone https://github.com/blrk/devops-project.git
```
* navigate inside the weapp directory and edit the index.jsp file
``` bash
 cd webapp/src/main/webapp/
 
(base) blrk@desktop:~/aws/devops-project/webapp/src/main/webapp> ls
index.jsp  WEB-INF

(base) blrk@desktop:~/aws/devops-project/webapp/src/main/webapp> vi index.jsp 

(base) blrk@desktop:~/aws/devops-project/webapp/src/main/webapp> git add .

(base) blrk@desktop:~/aws/devops-project/webapp/src/main/webapp> git commit -m "code modified" 
[master 935b330] code modified
 1 file changed, 1 insertion(+)
 
(base) blrk@desktop:~/aws/devops-project/webapp/src/main/webapp> git push
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (7/7), 544 bytes | 544.00 KiB/s, done.
Total 7 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/blrk/devops-project.git
   7579882..935b330  master -> master
(base) blrk@desktop:~/aws/devops-project/webapp/src/main/webapp> 
```
* Go to the Jenkins dashboard and check the changes

