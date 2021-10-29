# Creating Multiple Deployments

We want to deploy the tasks api in separate pods. We want the auth api in a separate pod. 
Both should not be public facing.

The users api should be public facing.

1. Create new `auth-deployment.yaml` file.
2. Remove auth container from `users-deployment.yaml`
3. Create a new `auth-service.yaml` file.

