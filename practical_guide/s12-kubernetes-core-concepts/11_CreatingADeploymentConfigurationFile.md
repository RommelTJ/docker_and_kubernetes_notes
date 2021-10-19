# Creating a Deployment Configuration File (Declarative Approach)

See: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

1. We created a file called `deployment.yaml` under `kube-action-app`.
2. Then apply with: `kubectl apply -f=deployment.yaml`
3. Then we added a `service.yaml` to expose the pods via a service.
4. Then apply with: `kubectl apply -f service.yaml`
5. View app with `minikube service backend`
