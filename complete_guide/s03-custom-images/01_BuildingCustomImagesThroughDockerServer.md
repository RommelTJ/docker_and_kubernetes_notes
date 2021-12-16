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
