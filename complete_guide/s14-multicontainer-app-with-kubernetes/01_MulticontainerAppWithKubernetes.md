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

## Reapplying a Batch of Config Files

```
kubectl apply -f k8s
kubectl get pods
kubectl get deployments
kubectl get services
kubectl get pods
kubectl logs server-deployment-58665d5c78-45tf8
```

## Creating and Applying Redis Config

See `redis-deployment.yaml`.
See `redis-cluster-ip-service.yaml`.
Then: `kubectl apply -f k8s`

## Last Set of Boring Config

See `postgres-deployment.yaml`.
See `postgres-cluster-ip-service.yaml`.
Then: `kubectl apply -f k8s`.

## The need for Volumes with Databases

* PVC = Persistent Volume Claim.
* Postgres takes data and writes it to a filesystem.
* If the pod crashes, we lose the filesystem. It's deleted and replaced with a new pod.
* Volumes exist on the host machine, thus survive pod deletions.
* Replicas and PVCs are hard. Don't do it.

## Kubernetes Volumes

* Volume in generic container terminology
  * Some type of mechanism that allows a container to access a filesystem outside itself.
* Volume in Kubernetes
  * An object that allows a container to store data at the pod level.
  * In Kubernetes, we have "Volume", "Persistent Volume", and "Persistent Volume Claim".
  * We won't use a "Volume". We'll use a "Persistent Volume" or a "Persistent Volume Claim".
* A "Volume" in a Kubernetes deployment lives inside a pod.
  * If a container in a pod dies, a new container can connect to this volume.
  * But if the pod itself dies, the volume goes with it.
  * Thus, a Volume is not appropriate for a database.
