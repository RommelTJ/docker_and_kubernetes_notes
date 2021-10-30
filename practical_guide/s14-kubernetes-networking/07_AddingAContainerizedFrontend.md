# Adding a Containerized Frontend

1. Add frontend
2. `docker build -t rommelrico/kub-network-frontend .`
3. `docker push rommelrico/kub-network-frontend`
4. `docker run -p 80:80 --rm -d rommelrico/kub-network-frontend`
5. Go to localhost. Get CORS error.
6. Update `tasks-api` to include headers for CORS fix.
7. `docker build -t rommelrico/kub-network-tasks .`
8. `docker push rommelrico/kub-network-tasks`
9. `kubectl delete deployment tasks-deployment`
10. `kubectl apply -f=tasks-deployment.yaml`
