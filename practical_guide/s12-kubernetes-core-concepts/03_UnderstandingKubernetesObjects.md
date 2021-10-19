# Understanding Kubernetes Objects (Resources)

Kubernetes works with Objects
* Pods
* Deployments
* Services
* Volume
* etc

Objects can be created in two ways: Imperatively or Declaratively.

## The "Pod" Object

* The smallest "unit" Kubernetes interacts with
  * Contains and runs one or multiple containers. Typically, one.
  * Pods contain shared resources (e.g. volumes) for all Pod containers
  * Has a cluster-internal IP by default
    * Containers inside a Pod can communicate via localhost.

Pods are designed to be ephemeral: Kubernetes will start, stop and replace them as needed.

For Pods to be managed for you, you need a "Controller" (e.g. a "Deployment").

## The "Deployment" Object

* Controls one or multiple pods
  * You set a desired state, Kubernetes then changes the actual state
    * Define which Pods and containers to run and the number of instances
  * Deployments can be paused, deleted and rolled back
  * Deployments can be scaled dynamically (and automatically)
    * You can change the number of desired Pods as needed
* Deployments manage a Pod for you, you can also create multiple deployments.
* You therefore typically don't directly control Pods, instead you use deployments to set up the desired
end state.
