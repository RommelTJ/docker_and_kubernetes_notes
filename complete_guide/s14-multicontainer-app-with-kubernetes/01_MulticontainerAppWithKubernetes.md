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

## The Cluster IP Config

See `client-cluster-ip-service.yaml`.

## Applying Multiple Files with Kubectl

```
kubectl get deployments
kubectl delete deployment client-deployment
kubectl get deployments

kubectl get services
kubectl delete service client-node-port
kubectl get services

kubectl apply -f k8s
kubectl get deployments
kubectl get pods
kubectl get services
```

## Express API Deployment Config

See `server-deployment.yaml`

## ClusterIP for the Express API

See `server-cluster-ip-service.yaml`

## Combining Config Into Single Files

* Having to create separate files for each object can be cumbersome.
* You can combine configs on a single file with a `---`.
* We don't do this because it makes sense to separate what objects exist in your cluster.

## The Worker Deployment

See `worker-deployment.yaml`
