# Multi-container apps

## Dockerizing MongoDB

```shell
docker run --name mongodb --rm -d -p 27017:27017 mongo
```

## Dockerizing the Node app

```shell
docker build -t goals-node .
docker run --name goals-backend --rm -d -p 80:80 goals-node
```

## Dockerizing the React app

```shell
docker build -t goals-react .
docker run --name goals-frontend --rm -p 3000:3000 -it goals-react
```

## Adding Docker Networks for Efficient Cross-Container Communication

```shell
docker network create goals-net
docker run --name mongodb --rm -d --network goals-net mongo
docker run --name goals-backend --rm -d --network goals-net -p 80:80 goals-node
docker run --name goals-frontend --rm -p 3000:3000 -it goals-react
```

## Adding Data Persistence to MongoDB with Volumes

Before this, if we stop mongodb and rerun it, it works but the data is gone.
If you want the data to be persisted, you need to add volumes to mongodb.

Using a Named Volume:
```shell
docker run --name mongodb -v data:/data/db --rm -d --network goals-net mongo
```

Securing the mongodb:
```shell
docker run --name mongodb -v data:/data/db --rm -d --network goals-net -e MONGO_INITDB_ROOT_USERNAME=rommeladmin -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
```

### Volumes, Bind Mounts and Polishing for the NodeJS Container

Want to:
* add a bind mount for live data, 
* add a named volume for logs, and 
* tell the container to not overwrite node_modules: 
```shell
docker run --name goals-backend -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s05-multicontainer-apps/multi-01-starting/backend:/app -v logs:/app/logs -v /app/node_modules --rm -d --network goals-net -p 80:80 goals-node
```

Want to fix the node server so that it restarts the server on changes (nodemon): 
```shell
Update package.json
Update Dockerfile
docker build -t goals-node .
docker run --name goals-backend -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s05-multicontainer-apps/multi-01-starting/backend:/app -v logs:/app/logs -v /app/node_modules --rm -d --network goals-net -p 80:80 goals-node
```

Want to update for mongo environment variables:
```shell
docker run --name goals-backend -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s05-multicontainer-apps/multi-01-starting/backend:/app -v logs:/app/logs -v /app/node_modules -e MONGODB_USERNAME=rommeladmin -e MONGODB_PASSWORD=secret --rm -d --network goals-net -p 80:80 goals-node
```

### Live Source Code Updates for the React Container (with Bind Mounts)

```shell
docker run -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s05-multicontainer-apps/multi-01-starting/frontend/src:/app/src --name goals-frontend --rm -p 3000:3000 -it goals-react
```
