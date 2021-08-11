# Kubernetes: Required Setup and Installation Steps

What we need to install:
* Install Master Node, Worker Nodes, required software
* Install kubectl (a tool to send instructions to the cluster)
* Install Minikube

## MacOS Setup

Install Minikube: https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-minikube/

1. `sysctl -a | grep -E --color 'machdep.cpu.features|VMX'`
2. `brew install kubectl`
3. `kubectl version --client`
4. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
5. `brew install minikube`
6. `minikube start --driver=virtualbox`
7. `minikube status`
8. `minikube dashboard`

## Windows Setup

Install Minikube: https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-minikube/
