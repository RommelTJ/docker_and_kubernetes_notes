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
