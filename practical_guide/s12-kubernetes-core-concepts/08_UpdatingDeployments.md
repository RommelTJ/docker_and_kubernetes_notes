# Updating Deployments

1. Make change in source code.
2. Rebuild image: `docker build -t rommelrico/kube-action-app:2 .`
3. Push image: `docker push rommelrico/kube-action-app:2`
4. Update deployment: 
   1. `kubectl get deployments`
   2. `kubectl set image deployment/first-app kube-action-app=rommelrico/kube-action-app:2`
5. Check deployment status: `kubectl rollout status deployment/first-app`
