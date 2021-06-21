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

## Utilizing ENTRYPOINT

Entry point is a way to prefix the commands. So instead of calling "npm init" you could just call "init"
```shell
ENTRYPOINT [ "npm" ]
docker run -it -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s07-utility-containers/utility-container:/app mynpm init
docker run -it -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s07-utility-containers/utility-container:/app mynpm install express --save
```

# Using Docker Compose

docker-compose.yaml
```shell
version: "3.8"
services: 
  npm:
    build: ./
    stdin_open: true
    tty: true
    volumes:
      - ./:/app
```

Then run with: 
```shell
docker-compose run --rm npm init
```
