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

