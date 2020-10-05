### Integerate DockerHub with Ansible
* login into the Ansible server
* List all the images
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
devops-website-image   latest              4ea780e3efa5        3 days ago          647MB
<none>                 <none>              01354bec7302        3 days ago          647MB
tomcat                 latest              f796d3d2c195        2 weeks ago         647MB
```
### Tag your image
* Create a tag and list the images
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker tag devops-website-image blrk/devops-website-image
[msadmin@ip-172-31-3-12 ~]$ docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
devops-website-image        latest              4ea780e3efa5        3 days ago          647MB
blrk/devops-website-image   latest              4ea780e3efa5        3 days ago          647MB
<none>                      <none>              01354bec7302        3 days ago          647MB
tomcat                      latest              f796d3d2c195        2 weeks ago         647MB
```
### Push the tagged image to docker hub
* Login into the docker hub
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: blrk
Password: 
WARNING! Your password will be stored unencrypted in /home/msadmin/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```
* Push the docker image
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker push blrk/devops-website-image
The push refers to repository [docker.io/blrk/devops-website-image]
ce2c8bd94bb7: Pushed 
b654a29de9ee: Mounted from library/tomcat 
1485ce09f585: Mounted from library/tomcat 
eb6e8fe5c6dc: Mounted from library/tomcat 
8b185d674aef: Mounted from library/tomcat 
4f17d163126f: Mounted from library/tomcat 
df95ed2a791d: Mounted from library/tomcat 
17bdf5e22660: Mounted from library/tomcat 
d37096232ed8: Mounted from library/tomcat 
6add0d2b5482: Mounted from library/tomcat 
4ef54afed780: Mounted from library/tomcat 
latest: digest: sha256:0346878e33bd7e270010807d26a2d85d9aae77cb5651c153dee7f7345e457e3a size: 2629
```
* Open the DockerHub website 
* you can see your image listed there
### Remove all the images in Ansible server
* delete the images
``` bash
docker image rmi -f $(docker image ls -aq)
```
* Pull the docker image and list it
``` bash
[msadmin@ip-172-31-3-12 ~]$ docker pull blrk/devops-website-image
Using default tag: latest
latest: Pulling from blrk/devops-website-image
57df1a1f1ad8: Pull complete 
71e126169501: Pull complete 
1af28a55c3f3: Pull complete 
03f1c9932170: Pull complete 
881ad7aafb13: Pull complete 
9c0ffd4062f3: Pull complete 
bd62e479351a: Pull complete 
48ee8bc64dbc: Pull complete 
07cb85cca4f0: Pull complete 
6a78fac8d191: Pull complete 
ef31cf5c0516: Pull complete 
Digest: sha256:0346878e33bd7e270010807d26a2d85d9aae77cb5651c153dee7f7345e457e3a
Status: Downloaded newer image for blrk/devops-website-image:latest
docker.io/blrk/devops-website-image:latest
[msadmin@ip-172-31-3-12 ~]$ docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
blrk/devops-website-image   latest              4ea780e3efa5        3 days ago          647MB
```
### Login into the Docker host (Deployment system)
* switch to msadmin user
* Remove the existing images if any
``` bash
docker image rmi -f $(docker image ls -aq)
```
* List the docker images
``` bash
docker images
```
* Pull the image
``` bash
[msadmin@ip-172-31-11-1 ~]$ docker pull blrk/devops-website-image
Using default tag: latest
latest: Pulling from blrk/devops-website-image
57df1a1f1ad8: Already exists 
71e126169501: Already exists 
1af28a55c3f3: Already exists 
03f1c9932170: Already exists 
881ad7aafb13: Already exists 
9c0ffd4062f3: Already exists 
bd62e479351a: Already exists 
48ee8bc64dbc: Already exists 
07cb85cca4f0: Already exists 
6a78fac8d191: Already exists 
ef31cf5c0516: Pull complete 
Digest: sha256:0346878e33bd7e270010807d26a2d85d9aae77cb5651c153dee7f7345e457e3a
Status: Downloaded newer image for blrk/devops-website-image:latest
docker.io/blrk/devops-website-image:latest
[msadmin@ip-172-31-11-1 ~]$ docker image ls
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
blrk/devops-website-image   latest              4ea780e3efa5        3 days ago          647MB
```

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)
