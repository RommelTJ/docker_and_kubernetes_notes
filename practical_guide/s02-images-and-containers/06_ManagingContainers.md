# Managing Images and Containers

## Images

### Tagging

TODO

### Listing

TODO

### Analyzing

TODO

### Removing

TODO

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


### Listing

List running containers:  
`docker ps`

List all containers:  
`docker ps -a`

### Removing

TODO

### Stopping and Restarting

Stopping:  
`docker stop <CONTAINERID>`

Restarting a stopped container:  
- `docker start <CONTAINER_ID>`
- `docker start -a <CONTAINER_NAME>`
