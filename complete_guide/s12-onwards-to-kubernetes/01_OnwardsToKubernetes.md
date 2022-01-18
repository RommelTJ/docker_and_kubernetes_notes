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
