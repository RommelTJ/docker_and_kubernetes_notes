# A First Deployment - Using the Imperative Approach

1. `docker build -t kube-action-app .`
2. `minikube status` (or `minikube start --driver=virtualbox`)
3. `docker tag kube-action-app rommelrico/kube-action-app`
4. `docker push rommelrico/kube-action-app`
5. `kubectl create deployment first-app --image=rommelrico/kube-action-app`
6. `kubectl get deployments`
7. `kubectl get pods`
8. `minikube dashboard`
