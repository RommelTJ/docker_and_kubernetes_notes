# Building Custom Images Through Docker Server

## Creating Docker Images

We will do the following:  
* Dockerfile -> Docker Client -> Docker Server -> Usable Image.

Creating a Dockerfile: 
1. Specify a base image.
2. Run some commands to install additional programs.
3. Specify a command to run on container setup.

## Building a Dockerfile

See ./redis-image/Dockerfile.

```
docker build .
docker run 94de9090842b522cd3398d47ff14e645bb784bbf7b1f86f4fb65996d67271a34
```

## Dockerfile Teardown

* `FROM` is an instruction. Other instructions are `RUN`, and `CMD`.
* `FROM alpine` says to use alpine as a base image.
* `RUN apk add --update redis` tells Docker what to do.
* `CMD ["redis-server"]` tells Docker what to execute after container is built.

## What's a Base Image

Writing a Dockerfile is like being given a computer with no OS and being told to install Chrome.    

Alpine is a Linux OS that is optimized/suited to Docker development. It comes with a preinstalled set 
of programs that are useful to you (installing redis). It has "apk" preinstalled.

## The Build Process in Detail

What happens when you run `docker build .`?

* Docker build runs on the docker server. 
* The "." means the build context, the set of files and folders for the container.
* Every line of configuration in our Dockerfile corresponds to a "Step" in the terminal output.
* Alpine checks the cache and if not found it fetches it from DockerHub.
* When you run the apk command, it creates an intermediate container.
  * In memory, we very temporarily create a new container out of the previous step.
  * Command executes in temp container as a process.
    * Ex: Downloaded Redis and dependencies, created folders, etc.
  * We stop the temp container, take a file system snapshot, and save it as a new image.
  * This new image then gets forwarded into the next step.
* When CMD command runs, it looks at previous step image and creates a temp container.
  * Container is told ["redis-server"] is its primary command.
  * We stop the temp container, take a file system snapshot and primary command, save it as an image.
  * This new image then gets forwarded into the next step.
* We save the last image as the end result.

## A Brief Recap

Docker images are built as layers of images.

## Rebuilds with Cache

At every step we have a filesystem snapshot.

When we add to the Dockerfile: 
```
RUN apk add --update gcc
```

And then build again with `docker build .`,
* Step 1 is already cached because alpine is already downloaded from DockerHub.
* Step 2 is already cached.
  * Docker knows that the previous step hasn't changed.
  * Docker knows that it has previously run the apk command on that previous step.
* Step 3 executes because it's a new command in the Dockerfile.
* Step 4 executes because Step 3 is a new command.

If you execute the build command a third time, the cache will be set for Step 3 and 4.

Docker steps only run from the changed line down. Everything else is cached. The order of operation matters.

## Tagging an Image

```
docker run sha256:92231d3c2669b2cb49b1f16dbe15e964c4e2315c901a24c0610b75b424959d7a
```


Convention for tags:  
`DOCKER_ID`/`Repo/Project Name`:`Version`


With tag:  
```
docker build -t rommelrico/redis:latest .
docker run rommelrico/redis:latest
```

## Manual Image Generation with Docker Commit

```
docker run -it alpine sh
apk add --update redis
```

On another terminal, take snapshot:  
```
docker commit -c 'CMD ["redis-server"]' c79e1620f2de
docker run sha256:15f4742865b491923ad8196fa0cfa58b2499289b61ea739ee981bb81f872a9ad
```
