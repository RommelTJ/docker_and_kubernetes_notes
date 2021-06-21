# Working with Utility Containers and Executing Commands in Containers

"Utility Containers" is not an official term. It's a term to define containers that are not
application containers. They only have an environment. They run tasks.

## Why would you use them?

Say you wanted to scaffold a project similar to npm init. You could use a container to do this.

## Different ways of running commands in containers

```shell
docker run -it -d node
docker exec -it lucid_jones npm init
docker run -it node npm init
```

## Building a Utility Container

```shell
docker build -t node-util .
docker run -it -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s07-utility-containers/utility-container:/app node-util npm init
```
