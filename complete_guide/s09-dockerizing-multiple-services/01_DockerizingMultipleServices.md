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
