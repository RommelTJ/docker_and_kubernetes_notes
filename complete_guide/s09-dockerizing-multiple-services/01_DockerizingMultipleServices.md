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

Updated `docker-compose.yml` to set up environment variables.
* Two syntaxes: 
  * variableName=value
    * Sets up a variable in the container at run time.
  * variableName
    * Sets up a variable in the container at run time but value is taken from your computer.

```
docker compose up --build
```

## The Worker and Client Services

Added worker and client services to `docker-compose.yml`.

## Nginx Path Routing

* Our browser will ask for certain routes, but they need to be served from different apps.
  * /index.html -> React Server
  * /main.js -> React Server
  * /api/values/all -> Express Server
  * /api/values/current -> Express Server
* We will add a container with an Nginx server and configure routes for it.

## Routing with Nginx

* Created `default.conf` and added to Nginx config.
  * Tell Nginx there is an 'upstream' server at port 3000.
  * Tell Nginx there is an 'upstream' server at port 5000.
  * Listen on port 80.
  * If anyone comes to '/', send them to the client upstream.
  * If anyone comes to '/api', send them to the server upstream.
