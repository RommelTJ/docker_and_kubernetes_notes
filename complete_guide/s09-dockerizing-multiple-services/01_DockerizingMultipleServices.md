# Dockerizing Multiple Services

## Checkpoint

See complex app.

## Dockerizing a React App - Again!

* Setting up dev containers for each app.
* See client Dockerfile.dev.

```
docker build -f Dockerfile.dev -t rommelrico/complex-client .
docker run -it -p 3000:3000 rommelrico/complex-client
```

## Dockerizing Generic Node Apps

Setting up development docker files for server and worker projects.

```
docker build -f Dockerfile.dev -t rommelrico/complex-server .
docker run rommelrico/complex-server

docker build -f Dockerfile.dev -t rommelrico/complex-worker .
docker run rommelrico/complex-worker
```
