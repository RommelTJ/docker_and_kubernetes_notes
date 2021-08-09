# Kubernetes does NOT manage your infrastructure

## What Kubernetes Will Do
* Create your objects (e.g. Pods) and manage them
* Monitor Pods and re-create them, scale Pods etc.
* Kubernetes utilizes the provided (cloud) resources to apply your configuration/goals

## What You Need to Do / Setup
* Create the Cluster and the Node Instances (Worker + Master Nodes)
* Setup API Server, kubelet, and other Kubernetes services / software on Nodes
* Create other (cloud) provider resources that might be needed (e.g. Load Balancer)
