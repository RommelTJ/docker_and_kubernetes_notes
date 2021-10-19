# The Imperative Approach vs The Declarative Approach

Instead of writing commands manually, it would be nice to write configs to a file and apply file.

## A Resource Definition

A yaml file that defines a configuration for a deployment.

## Imperative vs Declarative Kubernetes Usage

* Imperative Approach
  * `kubectl create deployment ...`
  * Individual commands are executed to trigger certain Kubernetes actions
  * Comparable to using `docker run` only

* Declarative Approach
  * `kubectl apply -f config.yaml`
  * A config file is defined and applied to change the desired state.
  * Comparable to using `Docker Compose` with compose files.
