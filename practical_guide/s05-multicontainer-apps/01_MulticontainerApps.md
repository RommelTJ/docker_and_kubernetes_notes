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
