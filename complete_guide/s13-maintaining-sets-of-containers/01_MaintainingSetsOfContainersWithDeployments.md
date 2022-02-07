# Maintaining Sets of Containers with Deployments

## Updating Existing Objects

* Old Goal
  * Get the **multi-client** image running on our local Kubernetes Cluster running as a container.
* New Goal
  * Update our existing pod to use the **multi-worker** image.

* Imperative Approach
  * Run a command to list out current running pods.
  * Run a command to update the current pod to use a new image.
* Declarative Approach
  * Update our config file that originally created the pod.
  * Throw the updated config file into kubectl.
  * The approach we'll use.

* Updating an object
  * When we update a config file, an object gets created.
    * Name: "client-pod"
    * Kind: "pod"
    * Image: "multi-worker"
  * Master inspects name and kind properties.
  * Master looks at running instances.
  * When a new config file gets applied that matches the same and kind, the master treats it as an update.
  * The existing pods get redeployed with the updates.
  * If we made a change to the name, then the master would just spin up new pods and leave existing ones alone.

## Declarative Updates in Action

* See updates to `client-pod.yaml`
  * Changed: `stephengrider/multi-client` to `stephengrider/multi-worker`

```
kubectl apply -f client-pod.yaml
kubectl get pods
kubectl describe pod client-pod
```

## Limitations in Config Updates

* Updated `containerPort` in `client-pod.yml`.
* Run `kubectl apply -f client-pod.yaml`
* BOOM. ERRORS.
* You can only update certain configurations. 
* There is a workaround for this. Keep going through the lectures.

```
The Pod "client-pod" is invalid: spec: 
Forbidden: pod updates may not change fields other than 
`spec.containers[*].image`, 
`spec.initContainers[*].image`, 
`spec.activeDeadlineSeconds`, 
`spec.tolerations` (only additions to existing tolerations) or 
`spec.terminationGracePeriodSeconds` (allow it to be set to 1 if it was previously negative)
```

## Running Containers with Deployments

* Object types
  * Pods
    * Runs one or more closely related containers
  * Services
    * Sets up networking in a Kubernetes cluster
  * Deployment
    * Maintains a set of identical pods, ensuring that they have the correct config and that the right number exists.
* Differences between Pods and Deployments
  * Pods
    * Runs a single set of containers
    * Good for one-off dev purposes
    * Rarely used directly in Production
  * Deployment
    * Runs a set of identical pods (one or more)
    * Monitors the state of each pod, updating as necessary
    * Good for dev
    * Good for production
* When you create a deployment
  * It will have a Pod template
    * How many containers?
    * What name?
    * What port?
    * What image?

## Deployment Configuration Files

* We won't create Pods manually. We'll create Deployments.
* See `client-deployment.yaml`.

## Walking Through The Deployment Config

* `apiVersion` and `kind` specify the object we create.
* `metadata` section adds the name of our deployment.
* `template` specifies the configuration for every single pod that needs to be created/maintained by the deployment.
* `replicas` specifies the number of pods that the deployment needs to create/maintain.
* `selector` adds labels so that pods can be managed after they get created.
  * Ex: "I'll look for objects with label of component web".

## Applying a Deployment

* Remove an object
  * `kubectl delete -f client-pod.yaml`
  * This is an imperative update.

* Apply a deployment
  * `kubectl apply -f client-deployment.yaml`
  * This is a declarative update.

```
kubectl get pods
kubectl delete -f client-pod.yaml
kubectl apply -f client-deployment.yaml
kubectl get pods
kubectl get deployment
```

## Why use Services?

* The service watches for every pod that matches its selector
* If a pod restarts, it changes IP address.
* The service lets you always have the correct IP address for the Pod.

## Scaling and Changing Deployments

* Updating containerPort from port 3000 to 9999 in `client-deployment.yaml`.
* `kubectl apply -f client-deployment.yaml`
* `kubectl get deployments`
* `kubectl get pods`
* `kubectl describe pods`
  * Container is now running on Port 9999
  * (This is misleading since containerPort is purely informational. The docker container exposes port 3000.)
  * (Attached the Service to the deployment yaml and added commit message to hopefully make clearer.)

## Updating Deployment Images

* How do we update a deployment when there's a new version of an image?
* Update Image Version
  * Change deployment to use multi-client again
    * Saved file and `kubectl apply -f client-deployment.yaml`
  * Update the multi-client image, push to Docker Hub
  * Get the deployment to recreate our pods with the latest version of multi-client

## Rebuilding the Client Image

* Rebuild the client image.
* Push to Docker Hub.
* Update `client-deployment.yaml`

## Triggering Deployment Updates

* Get the deployment to recreate our pods with the latest version of multi-client.
* Convincing a deployment with the latest version of an image is not the easiest thing to do.
* Kubernetes Issue 33664 (Sep 28, 2016).
* Why is this so challenging?
  * Nothing in the deployment yaml has changed.
  * Kubernetes will reject the update since nothing has changed.
* How can we do this?
  * Manually delete pods to get the deployment to recreate them with the latest version.
    * Deleting pods manually seems silly.
  * Tag built images with a real version number and specify that version in the config file.
    * Adds an extra step in the production deployment process.
    * We are not allowed to use environment variables in config files.
  * Use an imperative command to update the image version that the deployment should use.
    * Uses an imperative command.

## Imperatively Updating a Deployment's Image

* Tag the image with a version number, and push it to Docker Hub.
* Run a `kubectl` command forcing the deployment to use the new image version.
  * `kubectl set image <object_type>/<object_name> <container_name>=<new_image_to_use>`

```
docker build -t stephengrider/multi-client:v5 .
docker push stephengrider/multi-client:v5
kubectl set image deployment/client-deployment client=stephengrider/multi-client:v5
```

## Multiple Docker Installations

* Lecture does not apply due to using Docker Desktop Kubernetes and not Minikube.

## Reconfiguring Docker CLI

* Lecture does not apply due to using Docker Desktop Kubernetes and not Minikube.

## Why Mess with Docker in the Node?

* Lecture does not apply due to using Docker Desktop Kubernetes and not Minikube.
