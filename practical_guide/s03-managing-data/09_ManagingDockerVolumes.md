# Managing Docker Volumes

* List docker volumes: `docker volume ls` (Bind Mounts don't show up because we specify it. 
  Docker is not in control of it).
* Create docker volumes: `docker volume create <NAME>`
* Delete docker volume: `docker volume rm <NAME>`
* Inspect docker volume: `docker volume inspect feedback`
* Delete all unused volumes: `docker volume prune`
