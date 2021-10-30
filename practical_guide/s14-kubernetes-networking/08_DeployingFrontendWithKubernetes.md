# Deploying the Frontend with Kubernetes

All we have to do is run is as a container and set up the yaml files.
1. Create `frontend-deployment.yaml`.
2. Create `frontend-service.yaml`.
3. `kubectl apply -f=frontend-deployment.yaml -f=frontend-service.yaml`
4. `minikube service frontend-service`
