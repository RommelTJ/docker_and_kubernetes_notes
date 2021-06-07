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
