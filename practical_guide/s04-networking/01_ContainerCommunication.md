# Container Communication

## Types of Communication

* Case 1: Container to WWW Communication
* Case 2: Container to Local Host Machine Communication
* Case 3: Container to Container Communication

## Container to WWW

Out of the box, containers can send request to the WWW. 
You don't need any special setup.

## Container to Local Host Machine

Use `host.docker.internal` as a domain.

## Container to Container

Setting up containerized mongo: 
```shell
docker run -d --name mongodb mongo
```

Getting IP Address for Mongo:
Under Network Settings (IP Address)
```shell
docker container inspect mongodb
```

But it's more elegant if you add containers to the network. 
See [02_ContainerNetworks](./02_ContainerNetworks.md).
