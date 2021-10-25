# Using Environment Variables

See usage in `app.js`.

1. `docker build -t rommelrico/kub-data:2 .`
2. `docker push rommelrico/kub-data:2`
3. `kubectl apply -f=deployment.yaml`

## Environment Variables and ConfigMaps

See usage in `environment.yaml`.

1. `kubectl apply -f=environment.yaml`
2. `kubectl get configmap`
3. `kubectl apply -f=deployment.yaml`
4. `kubectl get deployments`
