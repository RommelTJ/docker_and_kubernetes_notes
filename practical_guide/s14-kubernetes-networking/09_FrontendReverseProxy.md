# Using a Reverse Proxy for the Frontend

A reverse proxy is a way to redirect a request to another IP.

1. Edit `nginx.conf` to enable reverse proxy.
2. Update your app to use the `/api` reverse proxy.
3. `docker build -t rommelrico/kub-network-frontend .`
4. `docker push rommelrico/kub-network-frontend`
5. `kubectl delete deployment frontend-deployment`
6. `kubectl apply -f=frontend-deployment.yaml`
7. `minikube service frontend-service`
