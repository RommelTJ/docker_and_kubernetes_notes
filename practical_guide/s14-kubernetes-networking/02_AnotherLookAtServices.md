# Another Look at Services

Services gives us a stable IP address and allow outside-world access.

1. Add a Service to be able to send network requests
   1. Write a `users-service.yaml` file.
   2. `kubectl apply -f=users-service.yaml`
   3. `minikube service users-service`
