# Handling Traffic with Ingress Controllers

## Load Balancer Services

* Services set up networking in a Kubernetes Cluster
  * ClusterIP
    * Exposes a set of pods to other objects in the cluster
  * NodePort
    * Exposes a set of pods to the outside world (only good for dev purposes)
  * LoadBalancer
    * Legacy way of getting network traffic into a cluster
  * Ingress
    * Exposes a set of services to the outside world
* We won't use a LoadBalancer service.
  * A Load Balancer will only give you access to a set of pods.
  * We need access to multi-client and multi-server
  * Use an Ingress Service instead.

## Quick Notes on Ingresses

* There are many types of Ingresses
* We will use a specific type of Ingress: Nginx Ingress.
* We are using ingress-nginx, a community led project.
  * Setup of ingress-nginx changes depending on your environment (local, GC, AWS, Azure)
  * We are going to set up ingress-nginx on local and Google Cloud (GC).
* We are not using kubernetes-ingress, a project led by company nginx.
* When googling, search for the right one.

## Behind the Scenes of Ingress

* Ingress routing rules to get traffic to services.
  * The ingress config has a set of configuration rules describing how traffic should be routed.
* The controller for our Ingress works to make sure these routing rules are set up.
* Results in created Pod running nginx that handles routing.
* We are using ingress-nginx.
  * With ingress-nginx, the Ingress Controller and the thing that routes traffic is the same thing.
  * With kubernetes-nginx, the Ingress Controller and the thing that routes traffic are different things.
