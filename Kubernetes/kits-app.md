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
