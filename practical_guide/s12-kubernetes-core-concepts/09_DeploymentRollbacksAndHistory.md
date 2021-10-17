# Deployment Rollbacks and History

1. Checking for a deployment status: `kubectl rollout status deployment/first-app`
2. Rollback an update: 
   1. `kubectl get pods`
   2. `kubectl rollout undo deployment/first-app`

To view history and roll back further: 
1. Get rollout history:
   * `kubectl rollout history deployment/first-app`
   * `kubectl rollout history deployment/first-app --revision 3`
2. Undo: `kubectl rollout undo deployment/first-app --to-revision=1`

## Cleanup

1. Delete app: `kubectl delete service first-app`
2. Delete deployment: `kubectl delete deployment first-app`
