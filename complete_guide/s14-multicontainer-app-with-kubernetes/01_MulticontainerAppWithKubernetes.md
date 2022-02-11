# A Multi-Container App With Kubernetes

## The Path to Production

* Taking the complex app and bringing it to Kubernetes.
* We will go over Ingress Service and ClusterIP Service.
* We will go over PVC (Persistent Volume Claim).
* Path to Production
  * Create a config file for each service and deployment
  * Test locally on Minikube (or Docker Desktop)
  * Create a GitHub / Travis flow to build images and deploy
  * Deploy app to a Cloud Provider

## A Quick Checkpoint

* There's a zip files with files.
* Let's make sure everything still works.

```
docker-compose up --build
docker-compose up
http://localhost/

docker-compose -f docker-compose-dev.yml up --build
docker-compose -f docker-compose-dev.yml up
http://localhost:3050/
```

## Recreating the Deployment

* Deleted travis file.
* Deleted Docker compose file.
* Deleted nginx image.
* Created k8s folder for 11 config files.
* Added `client-deployment.yaml` file.

## The NodePort vs ClusterIP Services

* A NodePort exposes a set of pods to the outside world (only good for dev purposes)
* A ClusterIP exposes a set of pods to other objects in the cluster
  * Thus, you still need an Ingress service for the outside world.
