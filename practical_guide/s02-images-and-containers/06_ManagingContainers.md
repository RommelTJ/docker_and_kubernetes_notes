# Managing Images and Containers

## Images

### Tagging

Tagging an image:  
- `docker build -t goals:latest .`
- Image tags consist of a `name:tag` parts.
- The name defines the group of possible more specialized images
- The tag defines a specialized image within a group of images.

### Listing

Listing images:  
- `docker images`

### Analyzing

Inspecting images:  
- `docker image inspect <CONTAINER_ID>`

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

Naming a container:  
- `docker run -p 3000:80 -d --rm --name goalsapp 044ae05e172d`

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

Copying files or folders into a running container or out of a running container:  
- `docker cp temp/test.txt <CONTAINER_NAME>:<PATH>`
- `docker cp frosty_noether:/test test.txt`


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
