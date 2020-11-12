### Create Continuous Deployment Job using Ansible 
* login to Jenkins dashboard
* Click on New Item 
* Enter an item name : Ansible-CD-job
* Select Freestyle project
* Click on OK
* Select Post-build Actions tab
* In Post-build Actions select : send build artifacts over SSH
* SSH server name choose : Ansible_server
* Exec command (Give the ansible palybook command)
``` bash
ansible-playbook -i /opt/kub/myapp1/host /opt/kub/myapp1/kits-ansible-deploy.yml;

ansible-playbook -i /opt/kub/myapp1/host /opt/kub/myapp1/kits-ansible-service.yml
```
* Click on Apply and Save
* Note: delete the existing pods and service
* Click on Build Now
* login into the kub-cluster mastern node
* run the following commands
``` bash
ubuntu@ip-172-20-33-17:~/myapp1$ kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
kits-deployment-8674dd7bd7-clvj7   1/1     Running   0          82s
kits-deployment-8674dd7bd7-zdljj   1/1     Running   0          82s
ubuntu@ip-172-20-33-17:~/myapp1$ kubectl get service
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP                                                               PORT(S)          AGE
kits-service   LoadBalancer   100.66.166.49   a2009b1b2c3ca4ef78cb23b277586798-223794892.ap-south-1.elb.amazonaws.com   8080:31200/TCP   83s
kubernetes     ClusterIP      100.64.0.1      <none>                                                                    443/TCP          7h25m
```
* Check the status of application http://\<public-ip-of-kub-cluster-master-node\>:31200/webapp/

[Back to the mainpage](https://github.com/blrk/learn-devops.io/wiki)

