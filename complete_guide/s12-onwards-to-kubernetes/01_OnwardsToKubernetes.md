# Onwards to Kubernetes!

## The Why's and What's of Kubernetes

* What is Kubernetes? and Why do we need it?
* On AWS EB, we had a nginx server, routing to a node server or a client server, and a worker.
* How would we scale it?
* The bottleneck is the worker. Would be nice to easily spin up more instances of that worker.
* If scaling with Elastic Beanstalk
  * EB would spin up entire copies of all of our application and 
  * put them behind a Load Balancer.
  * We don't have much control about what is happening with an individual component.
* Kubernetes can help with this problem.
* A cluster is a master + 1 or more nodes.
* Kubernetes worker nodes can have any number of containers / pods.
* This gets us closer to our desired scaling strategy.

* What is Kubernetes?
  * A system for running containers over multiple different machines.
* Why use Kubernetes?
  * When you need to run different containers with different images.

## Kubernetes in Development and Production

* Development
  * Minikube
* Production
  * Amazon Elastic Container Service for Kubernetes (EKS)
  * Google Cloud Kubernetes Engine (GKE)
  * Do it yourself

When developing locally,
* kubectl
  * Used for managing containers in the node / cluster
* minikube
  * Used for managing the VM itself
* Virtual Machine (node)
  * Runs the containers

Local Kubernetes Development
* Install kubectl
  * CLI for interacting with our master node
* Install a VM driver virtualbox
  * Used to make a VM that will be your single node
* Install minikube
  * Runs a single node on that VM

## Mapping Existing Knowledge

Short-term goal:
* Get the complex-client image running on our local Kubernetes Cluster as a container.

In `docker-compose.yaml`:
* each service can be built into an image.
  * Kubernetes expects all images to be already built.
* each service can represent a container.
  * Kubernetes has one config per object we want to create.
* each service defines networking requirements.
  * Kubernetes asks you to manually set up all networking.

Thus, to get the complex-client running in our local cluster, we need to:
* Make sure our image is hosted on DockerHub
* Make one config file to create the container
* Make one config file to set up networking

## Adding Configuration Files

Using `image: stephengrider/multi-client` to avoid errors.

```
mkdir simplek8s
```

Created `client-pod.yaml` with config for creating container
Created `client-node-port.yaml` with config for networking.

## Object Types and API Versions

* Object Types ("kind")
  * A config file is used to create an "object".
  * Objects serve different purposes. Pod is used to run a container. Service is used for networking.
  * Examples: StatefulSet, ReplicaController, Pod, Service
* API Versions ("apiVersion")
  * Each API version defines a different set of 'objects' we can use

## Running containers in Pods

* Pods
  * A grouping of containers with a very specific purpose.
  * Kubernetes doesn't have the concept of "creating a container" and running it by itself.
  * The smallest unit of deployment in Kubernetes is a Pod.
  * Example of Pod with multiple containers:
    * Postgres container + logger container + backup manager container.

## Service Config Files in Depth

* metadata is used for printing information.
* Focusing on Service object and its config.
* Services set up networking in a Kubernetes Cluster.
  * Subtypes
    * ClusterIP
      * To be discussed later.
    * NodePort
      * Exposes a container to the outside world.
      * Only good for dev purposes.
    * LoadBalancer
      * To be discussed later.
    * Ingress
      * To be discussed later.
* Kubernetes VM runs as follows
  * kube-proxy communicates with the outside world.
  * Service NodePort gets request from kube-proxy.
    * Service has a selector with `component: web`
    * Service specifies port to communicate with.
  * Pod receives request from NodePort configured port.
    * Pod has a label with `component: web` thus it's found.
    * Pod is exposing port 3000 thus accepts the request.
  * Pod runs the application inside its container.
* Service ports
  * port
    * Used if another Pod needed to access the multi-client Pod.
    * Worthless in our case
  * targetPort
    * The port inside the Pod that we want to open up traffic to.
  * nodePort
    * What you and I type into the browser to communicate, e.g. `localhost:31515`.
    * Needs to be a number between 30000-32767
    * If we don't specify one, it's automatically assigned.
    * We don't use this in production because we don't want to expose the ports like this.

## Connecting to Running Containers

* Feed a config file to kubectl
* `kubectl apply -f <filename>`
* kubectl: CLI we use to change our k8s cluster
* apply: change the current configuration of our cluster

```
kubectl apply -f client-pod.yaml
kubectl apply -f client-node-port.yaml
```

* To get a status of pods: `kubectl get pods`
* To get status of services: `kubectl get services`
* `3050:31515/TCP` means `3050` is the port, `31515` is the nodePort.
* To access the app: `http://localhost:31515/`

## The Entire Deployment Flow

* What happens when you feed the config to kubectl?
* A Node is a computer or a VM that will run software
* The Master is a computer or VM that will control the Nodes.
* Deployment file says, "I want to create 4 copies of multi-worker"
* Deployment file is applied via kubectl.
* Master Node receives the config.
* kube-apiserver sees new file, reads it, interprets it.
* Master Node keeps record of responsibilities.
  * "I need to run multi-worker image."
  * "I need 4 copies."
  * "I am currently running 0."
* Master Node tells Node 0, run two copies; Node 1 run 1 copy; Node 2 run 1 copy.
* Worker Nodes have docker installed. 
  * They then reach out to DockerHub, 
  * Download images, 
  * Build the image, 
  * Run the image.
* Master Node gets status update from Worker Nodes.
  * "I need to run multi-worker image." Done.
  * "I need 4 copies." Done.
  * "I am currently running 4." Done.
* The Master is consistently polling each Node.
* If a Pod dies, the responsibilities list gets updated.
  * * "I need to run multi-worker image." Done.
  * "I need 4 copies." Done.
  * "I am currently running 3." Oops.
* Master selects a Worker Node to run an additional copy.
* Worker Node spins up a new copy.
* Master polls again and all done again.
* We work directly with the master node. We don't interact with the worker nodes.

## Imperative vs Declarative Deployments

Important Takeaways:  
* Kubernetes is a system to deploy containerized apps.
* Nodes are individual machines that run containers
* Masters are machines with a set of programs to manage nodes.
* Kubernetes didn't build our images.
* Kubernetes decided where to run each container. Each node can run a dissimilar set of containers.
* To deploy something, we update the desired state of the master with a config file.
* The master works constantly to meet your desired state.

Styles of deployments:  
* Imperative Deployments
  * "Do exactly these steps to arrive at this container setup."
  * It's hard. You have to come up with way to figure out current state, and plan to get to desired state.
* Declarative Deployments
  * "Our container setup should look like this. Make it happen."
  * Usually easier. You only need to come up with a desired state in the config file.

Recommendation:  
* When googling, you will sometimes see resources to do things imperatively. 
* You probably don't want to do those since the declarative approach is easier. 
