# Local Development With Skaffold

## Awkward Local Development

* We are sharing our source code between local directory and shared volume.
* That system only works for Docker Compose. Doesn't work with Kubernetes.
* That's where Skaffold comes in.
* Skaffold watches our local react project for changes, then
  * Mode 1: Rebuild client image from scratch, update k8s
  * Mode 2: Inject updated files into the client pod, rely on react app to automatically update itself.

## Installing Skaffold

Instructions: skaffold.dev/docs/getting-started

```
brew install skaffold
skaffold version
```

## The Skaffold Config File

See `skaffold.yaml`.

## Skaffold Sync Update

See `skaffold.yaml` and `Dockerfile.dev`.

Then run `skaffold dev`.

## Live Sync Changes

See above.

## Automatic shutdown

Ctrl+C will automatically remove pods automatically.

## Testing Live Sync with the API Server

More configurations for server and client. See `skaffold.yaml`.
