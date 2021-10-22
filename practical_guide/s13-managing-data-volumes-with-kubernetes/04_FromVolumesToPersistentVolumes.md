# From Volumes to Persistent Volumes

## Persistent Volumes

* Volumes are destroyed when a Pod is removed.
  * hostPath partially works around that in a "One-Node" environment.
* Pod and Node independent Volumes are sometimes required.
* Persistent Volumes

Persistent volumes is more than just retaining the data. It means separating the volumes from the Pods.
Persistent Volumes are built around pod and node independence.

## From Volumes to Persistent Volumes

* Normally, volumes would be inside of Pods.
* But with persistent volumes, there would be new resources called "Persistent Volumes"
* Nodes have a Persistent Volume Claim (PV Claim) to request access to the Persistent Volume.
* You can have claims to different volumes on different pods on different nodes.
* Data is not stored on the nodes.
* Refer to "Types of Persistent Volumes" documentation on Kubernetes website.
