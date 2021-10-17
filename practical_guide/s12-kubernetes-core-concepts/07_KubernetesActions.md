# Kubernetes Actions

## Restarting Containers

If a container crashes, kubernetes will restart the pod on its own because we created a service.
There is a CrashLoopBackOff that gets progressively longer to prevent trashing the machine.

## Scaling in Action

To scale a service:  
`kubectl scale deployment/first-app --replicas=3`

A "replica" is simply an instance of a Pod/Container. 3 Replicas means that the same Pod/Container is
running 3 times.
