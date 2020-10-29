### Create deployment and service using yaml files
* create a deployment file : [kits-deploy.yaml](https://github.com/blrk/learn-docker.io/blob/master/Kubernetes/kits-deploy.yaml)
* create a service file : [kits-service.yaml](https://github.com/blrk/learn-docker.io/blob/master/Kubernetes/kits-service.yaml)
* Apply a configuration to a resource by filename
``` bash
kubectl apply -f kits-deploy.yaml 
deployment.apps/kits-deployment created
```
* verify the deployement
``` bash
kubectl get deployments
NAME              READY   UP-TO-DATE   AVAILABLE   AGE
kits-deployment   2/2     2            2           27s
```
* Create a service
``` bash
 kubectl apply -f kits-service.yaml 
service/kits-service created
```
* List the services
``` bash
kubectl get services
NAME           TYPE           CLUSTER-IP     EXTERNAL-IP                                                                PORT(S)          AGE
kits-service   LoadBalancer   100.71.7.116   a8d80d6e44f6c4a84a257c9fc672d098-1739707794.ap-south-1.elb.amazonaws.com   8080:31200/TCP   51s
kubernetes     ClusterIP      100.64.0.1     <none>                                                                     443/TCP          9h
```
* list the pods
``` bash
 kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
kits-deployment-8674dd7bd7-48578   1/1     Running   0          13m
kits-deployment-8674dd7bd7-d5gf5   1/1     Running   0          13m
```
### Access the webpage running in pods
* Edit the security rules and and allow the port used 
* open a browser tab and in the address filed enter : http://\<public-ip-of-masternode\>:31200/webapp
* 
