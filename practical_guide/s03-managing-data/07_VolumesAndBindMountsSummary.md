# Volumes and Bind Mounts Summary

`docker run -v /app/data [...]` => Anonymous Volume  
`docker run -v data:/app/data [...]` => Named Volume  
`docker run -v /path/to/code:/app/code [...]` => Bind Mount

## Anonymous Volumes

* Created specifically for a single container
* Survives container shutdown/restart unless --rm is used
* Can not be shared across containers
* Since it's anonymous, it can't be re-used (even on the same image)

## Named Volumes

* They are named because you assign a name before the colon
* Created in general, not tied to any specific container
* Survives container shutdown/restart - removal via Docker CLI
* Can be shared across containers
* Can be re-used for same container (across restarts)

## Bind Mounts

* Location on host file system, not tied to any specific container
* Survives container shutdown/restart - removal on host fs
* Can be shared across containers
* Can be re-used for same container (across restarts)
