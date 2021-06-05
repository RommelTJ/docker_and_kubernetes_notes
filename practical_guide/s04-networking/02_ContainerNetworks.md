# Container Networks

Created them like: 
```shell
docker network create my_network
docker run --network my_network [...]
```

Within a Docker network, all containers can communication to each other and 
IP addresses are automatically resolved.

Example: 
```shell
docker network create favorites-net
docker run -d --name mongodb --network favorites-net mongo

// Then after updating the Mongo URI in the app to point to mongodb
docker run --name favorites -d --rm -p 3000:3000 --network favorites-net favorites-node
```
