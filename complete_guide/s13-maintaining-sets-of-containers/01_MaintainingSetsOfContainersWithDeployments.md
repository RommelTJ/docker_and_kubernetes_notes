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
