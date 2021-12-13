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
