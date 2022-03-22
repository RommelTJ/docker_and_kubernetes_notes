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
