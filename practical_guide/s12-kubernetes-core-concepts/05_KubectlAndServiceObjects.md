# Kubectl and the "Service" object

## Kubectl: Behind The Scenes

`kubectl create deployment --image ...`
* Sends command to Master Node (Control Plane)
* Scheduler analyzes the currently running Pods and finds the best Node for the new Pod(s)
* Worker Node receives image deployment.
* Kubelet manages the Pod and Containers in the Worker Node.
* Pod contains the container based on the image specified from the kubectl command.

