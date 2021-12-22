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
