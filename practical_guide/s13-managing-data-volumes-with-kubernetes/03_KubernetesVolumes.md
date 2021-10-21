# Kubernetes Volumes

If/when a container restarts, all of the data would be lost.

Official docs have a lot of information on Kubernetes volumes.

Kubernetes can mount Volumes into Containers
* A broad variety of Volume types/drivers are supported.

## A First Volume: The "emptyDir" Type

Volumes are attached to Pods and are Pod specific. Thus, we have to define volumes where we define pods.

1. Add error route
2. Add tag.
3. Apply new deployment
4. Crash the app. Notice data is lost.
5. Add volumes key.
6. Crash the app. Notice data is preserved.

Empty Dir creates a new empty directory and keeps directory alive as long as pod is alive.  
If pod is removed, volume is removed. If pod is created, new directory is created.  

## A Second Volume: The "hostPath" Type

If you add a replica, things are not working again.   
The "hostPath" driver lets you set a path on the host machine, thus letting you share data between pods
in the same machine.

## A Third Volume: The "CSI" Type

CSI = Container Storage Interface

* A very flexible volume type.
* Relatively new type.
* Added so Kubernetes Team doesn't have to build a specific interfaces for cloud providers or specific drivers.
