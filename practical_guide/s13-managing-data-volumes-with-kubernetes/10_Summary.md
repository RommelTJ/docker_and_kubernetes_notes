# Summary

Learned how to persist data using volumes.

* Volumes can be used in simple scenarios where there is a single host machine. 
* Persistent Volumes need to be used when scaling to multiple machines or when using a cloud provider
because Pods can be destroyed. Persistent Volumes are an additional resource of the Kubernetes Cluster.
* Persistent Volume Claims defined how the volume should be claimed, how much storage it can use, and what 
type of storage it can use via class names.
* We also learned about how to set up environment variables either via the env key or a ConfigMap.
