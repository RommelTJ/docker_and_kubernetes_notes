# Kubectl and the "Service" object

## Kubectl: Behind The Scenes

`kubectl create deployment --image ...`
* Sends command to Master Node (Control Plane)
* Scheduler analyzes the currently running Pods and finds the best Node for the new Pod(s)
* Worker Node receives image deployment.
* Kubelet manages the Pod and Containers in the Worker Node.
* Pod contains the container based on the image specified from the kubectl command.

## The "Service" Object (Resource)

* Exposes Pods to the Cluster or Externally
* Pods have an internal IP address by default - it changes when a Pod is replaced.
* Finding Pods is hard if the IP changes all the time.
* Services group Pods with a shared IP.
* Services can allow external access to Pods.
* The default (internal only) can be overwritten

Without Services, Pods are very hard to reach and communication is difficult.  

Reaching a Pod from outside the Cluster is not possible at all without Services.

