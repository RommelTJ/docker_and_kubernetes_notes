# Creating a First Deployment

1. Clean up from last project:
   1. `kubectl delete deployment story-deployment`
   2. `kubectl delete service story-service`
2. Deploy the users-api.
   1. Create the repo on docker hub
   2. `docker build -t rommelrico/kub-network-users .`
   3. `docker push rommelrico/kub-network-users`
   4. (not required) Create a kubernetes directory with the k8s yaml files. 
   5. Write the `users-deployment.yaml` file.
   6. Apply: `kubectl apply -f=users-deployment.yaml`
   7. `kubectl get pods`
