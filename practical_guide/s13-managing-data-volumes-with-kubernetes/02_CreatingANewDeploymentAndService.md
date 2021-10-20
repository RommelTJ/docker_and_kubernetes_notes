# Creating a New Deployment and Service

1. `kubectl get deployments`
2. Add a `deployment.yaml` file
3. Add a `service.yaml` file
4. Build docker container: `docker build -t rommelrico/kub-data .`
5. Publish to Docker Hub: `docker push rommelrico/kub-data`
6. `kubectl apply -f=service.yaml -f=deployment.yaml`
7. `minikube service story-service`
