# Multiple Containers in One Pod

1. Revert the changes to use axios requests.
2. Replace the URL with an environment variable. Update `docker-compose.yaml` with the environment variable.
3. Create repo for Auth service on Docker Hub
4. `docker build -t rommelrico/kub-network-auth .`
5. `docker push rommelrico/kub-network-auth`
6. Add the service to the `users-deployment.yaml`
7. `docker build -t rommelrico/kub-network-users .`
8. `docker push rommelrico/kub-network-users`
9. Modify `users-deployment.yaml` to add env localhost.
10. `kubectl apply -f=users-deployment.yaml`

## Pod-internal Communication

When doing pod-internal communication, Kubernetes allows you to use `localhost` as an address to send a request to
another container running in the same Pod.
