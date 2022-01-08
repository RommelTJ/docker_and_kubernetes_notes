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

## Adding Postgres as a Service

* Want to set up a Docker Compose file for development.
  * postgres: what image to use?
  * redis: what image to use?
  * server: specify build, volumes, and environment variables.

See `docker-compose.yml`.

## Docker-compose config

* Setting up Redis in `docker-compose.yml`.
* Starting to set up build, volumes, and env variables in server in `docker-compose.yml`.

## Environment Variables with Docker Compose
