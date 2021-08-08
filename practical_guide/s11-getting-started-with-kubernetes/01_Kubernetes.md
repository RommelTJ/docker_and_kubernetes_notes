# Getting Started With Kubernetes

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications.

## Issues with Manual Deployment

* Manual Deployment of Containers is hard to maintain, error-prone and annoying
  * Even beyond security and configuration concerns!
* Containers might crash / go down and need to be replaced
* We might need more container instances upon traffic spikes
* Incoming traffic should be distributed equally

## Why Kubernetes?

* AWS ECS and other managed container services will help with a lot of issues with manual deployment
* But that locks us in!
* Using a specific cloud service locks us into that service
* You need to learn the specifics for AWS ECS, services and configs and if we wanted to switch we would have to
translate them to another provider
* Just knowing Docker isn't enough!
* Might be fine if you just want to stick with one provider

## What is Kubernetes exactly?

K8s is an open-source system (and de-facto standard) for orchestrating container deployments

Helps with: 
* Automatic deployment
* Scaling and Load Balancing
* Management

Kubernetes configuration
* A desired architecture, number of running containers, etc.
* Send to some provider-specific setup or tool
* Deploy to any cloud provider or remote machines (your own datacenter)
* A standardized way of describing the to-be-created and to-be-managed resources of the K8s cluster
* Cloud-provider-specific settings can be added

### What Kubernetes IS and IS NOT

* It's NOT a cloud service provider
* It's NOT a service by a cloud service provider
* It's not restricted to any specific cloud service provider
* It's NOT a software you run on some machine. It's a collection of concepts and tools.
* It's NOT an alternative to Docker
* It's NOT a paid service

**Kubernetes is like docker-compose for multiple machines**

## Kubernetes: Architecture and Core Concepts

* Pod (container): Smallest possible unit in k8s. Holds a container.
* Worker Node: A machine/virtual instance that runs the containers of your application.
* Proxy/Config: A tool that kubernetes uses in a worker node to control the network for pods.
* You can have multiple worker nodes. Multiple pods can be created and removed to scale your app.
* Master Node: A machine/virtual instance that runs the control plane.
* The Control Plane: A collection of components that control all your worker nodes, i.e. your deployment.
* Cluster: A set of master node and worker nodes that comprise a k8s deployment.
* The cluster can send instructions to communicate with a cloud provider API.

## Kubernetes will NOT manage your infrastructure

### What Kubernetes will do
* Create your objects (e.g. Pods) and manage them
* Monitor Pods and re-create them, scale them, etc.
* Kubernetes utilizes the provided cloud resources to apply your configuration / goals

### What you need to do / setup
* Create the cluster and the node instances (worker + master nodes)
* Setup API server, kubelet and other Kubernetes services / software on nodes
* Create other cloud provider resources that might be needed (e.g. Load Balancer, Filesystems)

## A closer look at the Worker Nodes

A worker node is a computer. It is managed by the master node.  
A pod hosts one or more application containers and their resources (volumes, IP, run configs).  
Pods are created and managed by Kubernetes.  
Docker runs on the Worker Node.  
Kubelet runs on the Worker Node. A service running on a worker node that communicates with the master node.    
A kube-proxy runs on the Worker Node. A service that manages node and pod network configurations.  
