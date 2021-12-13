# Manipulating Containers with the Docker Client

## Docker Run in Detail

```
docker run hello-world
```

## Overriding Default Commands

```
docker run busybox echo hi there
docker run busybox ls
```

## Listing Running Containers

```
docker ps

docker run busybox ping google.com
docker ps

docker ps --all
```

## Container Lifecycle

1. docker run = docker create + docker start.
2. Create will create a container.
3. Start will start the container.

```
docker create hello-world
docker start -a 6b444fcc81beda8616cd70f2c93282cd38e04a06e3cacdccef5be6e6f9c67540
```

"-a" makes it attach and watch for output and print it to the terminal.

Docker run will by default show you the terminal output. 
Docker start will by default not show you the terminal output.

## Restarting Stopped Containers

```
docker ps --all
docker run busybox echo hi there
docker ps --all
docker start -a e0d8e06109ff
```

The last command prints "hi there" again because it runs the override command.

## Removing Stopped Containers

```
docker ps --all
docker system prune
```

## Retrieving log outputs

```
docker create busybox echo hi there
docker start 918a805075137eadbe7e198650c88cf7d5e9b4d943d1734a9e96c1e0feded338
docker logs 918a805075137eadbe7e198650c88cf7d5e9b4d943d1734a9e96c1e0feded338
```

## Stopping Containers

```
docker create busybox ping google.com
docker start aa8bc00f997240fb074c2ef064d036b098b9263f7ed212461b682443570e82be
docker logs aa8bc00f997240fb074c2ef064d036b098b9263f7ed212461b682443570e82be
docker ps

docker stop aa8bc00f997240fb074c2ef064d036b098b9263f7ed212461b682443570e82be
-or-
docker kill aa8bc00f997240fb074c2ef064d036b098b9263f7ed212461b682443570e82be

docker ps
```

Stop sends hardware signal to container (SIGTERM) to tell the process to shutdown cleanly.

Kill sends hardware signal to container (SIGKILL) to abruptly shut down the container.

## Multi-Command Containers

```
redis-server
redis-cli
set mynumber 5
get mynumber
```

```
docker run redis
```

Cannot use redis-cli against this redis container.

## Executing Commands in Running Containers

```
docker run redis
docker exec -it 773cdf779f96 redis-cli
set mynumber 6
get mynumber
```

## The purpose of the IT flag

* "-it" stands for interactive terminal.
* Every process in Linux has STDIN, STDOUT, and STDERR.
* When you run a command in docker, it goes into STDIN.
* The "-i" flag means when we execute this command, attach our terminal to the STDIN terminal.
* The "-t" flag means make all the text show nicely formatted on the screen.

## Getting a Command Prompt in a Container

To open a shell in a running container:  
```
docker ps
docker exec -it 773cdf779f96 sh
> ls
> redis-cli
set mynumber 7
get mynumber
> exit
```
