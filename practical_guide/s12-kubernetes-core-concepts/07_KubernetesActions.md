# Kubernetes Actions

## Restarting Containers

If a container crashes, kubernetes will restart the pod on its own because we created a service.
There is a CrashLoopBackOff that gets progressively longer to prevent trashing the machine.
