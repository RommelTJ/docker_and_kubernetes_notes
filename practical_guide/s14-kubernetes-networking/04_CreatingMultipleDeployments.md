# Creating Multiple Deployments

We want to deploy the tasks api in separate pods. We want the auth api in a separate pod. 
Both should not be public facing.

The users api should be public facing.

1. Create new `auth-deployment.yaml` file.
2. Remove auth container from `users-deployment.yaml`
3. Create a new `auth-service.yaml` file.
4. Update the app to use the kubernetes environment names.
5. Redeploy `users-api`
   1. `docker build -t rommelrico/kub-network-users .`
   2. `docker push rommelrico/kub-network-users`
6. Apply kubernetes images: `kubectl apply -f=users-deployment.yaml`

## Pod-to-Pod Communication with IP Addresses and Environment variables

Kubernetes will get you environment variables automatically for your services.

This is your service name, all caps, with dashes replaced by underscores: `auth-service` -> `AUTH_SERVICE`, 
then the service host IP: `AUTH_SERVICE_SERVICE_HOST`.
