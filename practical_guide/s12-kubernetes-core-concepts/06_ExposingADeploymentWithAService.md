# Exposing a Deployment with a Service

Create a Service: 
* `kubectl expose deployment first-app --type=LoadBalancer --port=8080`

Check exposed services: 
* `kubectl get services`

Setup external IP in Minikube: 
* `minikube service first-app`
