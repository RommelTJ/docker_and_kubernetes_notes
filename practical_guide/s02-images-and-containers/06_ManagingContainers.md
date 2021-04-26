# Managing Images and Containers

## Images

### Tagging

TODO

### Listing

Listing images:  
- `docker images`

### Analyzing

TODO

### Removing

Removing images:  
- `docker rmi <IMAGE_ID>`
- You can only remove images if no containers are using them.

Removing all unused images:  
- `docker image prune`

Removing a container automatically when it exits:  
- `docker run --rm`

## Containers

### Naming

TODO

### Configuring

Detached Mode:  
By default, `docker start` will run a container in the background.
- `docker start -a <CONTAINER_ID>` (to run in attached mode)

Attached Mode:  
By default, `docker run` will run a container in the foreground.
- `docker run -d -p 8000:80 tender_noyce` (to run in detached mode)
- You can attach yourself to a detached container with: `docker attach <CONTAINER_ID>`.

Logs:  
- `docker logs <CONTAINER_ID>`
- `docker logs <CONTAINER_NAME> -f`

Interactive Mode:
- `docker run -it <CONTAINER_ID>`
- `docker start -ai <CONTAINER_NAME>`

### Listing

List running containers:  
`docker ps`

List all containers:  
`docker ps -a`

### Removing

Removing an individual container:  
- `docker rm <CONTAINER_ID>`
- `docker rm <CONTAINER_NAME> <CONTAINER_NAME>`

Removing all stopped containers:  
- `docker container prune`

### Stopping and Restarting

Stopping:  
`docker stop <CONTAINERID>`

Restarting a stopped container:  
- `docker start <CONTAINER_ID>`
- `docker start -a <CONTAINER_NAME>`
