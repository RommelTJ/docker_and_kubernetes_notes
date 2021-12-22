# Docker Compose with Multiple Local Containers

## App Overview

What we will build:  
* App with a Docker container for Node app
* Separate container for Redis.

## Assembling a Dockerfile

See Dockerfile for node app.

```
docker build -t rommelrico/visits:latest .
```

## Introducing Docker Compose

```
docker run redis
```

If you try 
```
docker run rommelrico/visits
```
you still get an error because the two containers don't have automatic communication. To resolve this, we set up 
network infrastructure between the two.

Options: 
* Use Docker CLI's networking features.
* Use Docker Compose.

We will use Docker Compose because Docker CLI is difficult to use.

Docker Compose:  
* Separate CLI installed with Docker
* Used to start up multiple Docker containers at the same time
* Automates long arguments we were passing to `docker run`.
* Sets up networking for us automatically.

## Docker Compose Files

* Commands have to be written into `docker-compose.yml` file in the correct syntax. 
* Then you can run the docker-compose CLI.

## Networking with Docker Compose

We update `index.js` by setting up the service name to redis. 

## Docker Compose Commands

Start Docker Compose Services:  
```
docker-compose up
```

Start and Rebuild Docker Images:  
```
docker-compose up --build
```

## Stopping Docker Containers

Shutting down docker compose services:
```
docker-compose down
```

## Container Maintenance with Compose

Update index.js so that it fails/crashes.

```
docker ps
// Notice node-server crashed. Only redis-server is running
```

## Automatic Container Restarts

We will add a restart policy. Available policies:  
* "no"
  * Never attempt to restart container
  * "no" has to be in quotes because in yaml 'no' is interpreted as a boolean false.
* always
  * Always attempt to restart container
  * Recommended for public servers.
* on-failure
  * Only restart the container if the container stops with an error code.
  * Recommended for processes that might complete a job.
* unless-stopped
  * Always restart unless we, the developers, forcibly stop it.

## Container Status with Docker Compose

List running containers using docker compose:  
```
docker-compose ps
```

Note that you have to run it from the same directory as that docker-compose file. It needs the yaml file.
