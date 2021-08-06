# Docker and Containers: A Summary

## Images and Containers

* Containers 
  * Isolated, boxes of code and environment to run the task
  * Single-task focused
  * Should be easy to share and reproduce
  * Stateless (+ volumes)
  * Read-write layer on top of image

* Images
  * Created from Dockerfiles or pulled from Docker Hub
  * Contains the instructions for creating containers
  * Blueprints for containers
  * Read-Only / Does not run
  * Can be built + shared

## Key commands

* `docker build -t NAME:TAG .`
  * Build an image based on a Dockerfile
  * Name & versions of an image
  * Build context

* `docker run --name NAME --rm -d IMAGE`
  * Run a container based on a remote or local image
  * Container name, Remove once stopped, Detached mode

* `docker push REPOSITORY/NAME:TAG`
  * Share (push) an image to a Registry like DockerHub
* `docker pull REPOSITORY/NAME:TAG`
  * Fetch (pull) an image from a Registry like DockerHub

## Data, Volumes And Networking

* Containers are isolated and stateless
* Containers have their own data and filesystem, detached from the host machine filesystem
  * Use Bind Mounts to connect host machine folders
  * `-v /local/path:/container/path`
* They can store data internally, but data will be lost if the container is removed and replaced by a new one
  * Use Volumes to persist data
  * `-v NAME:/container/path`

* Containers are isolated but can be connected to send requests to each other (e.g. HTTP)
  * Option 1: Determine container IP and use that. But it might change and it's a lot of manual work.
  * Option 2: Create a Docker Network and add containers to it. Containers can use each other's name as request addresses.

