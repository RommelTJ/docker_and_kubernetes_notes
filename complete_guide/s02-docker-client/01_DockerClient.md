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
