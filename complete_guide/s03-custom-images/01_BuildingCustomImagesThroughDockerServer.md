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
