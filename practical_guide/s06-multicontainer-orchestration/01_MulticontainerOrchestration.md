# Elegant Multi-container Orchestration

What do we do when we need to run many long and complicated docker commands to 
run an app? This is multi-container orchestration. We solve this through docker 
compose.


## Docker Compose: What & Why?

Docker compose is a tool that allows you to replace `docker build` and 
`docker run` commands with a single configuration file and a set of 
orchestration commands.

Docker Compose doesn't replace Dockerfiles for custom images.

Docker Compose doesn't replace images or containers.

Docker Compose is not suited for managing multiple containers on different hosts.


## Writing Docker Compose Files

Services (Containers)
* Define published ports
* Environment variables
* Volumes
* Networks
