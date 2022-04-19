# Local Development With Skaffold

## Awkward Local Development

* We are sharing our source code between local directory and shared volume.
* That system only works for Docker Compose. Doesn't work with Kubernetes.
* That's where Skaffold comes in.
* Skaffold watches our local react project for changes, then
  * Mode 1: Rebuild client image from scratch, update k8s
  * Mode 2: Inject updated files into the client pod, rely on react app to automatically update itself.
