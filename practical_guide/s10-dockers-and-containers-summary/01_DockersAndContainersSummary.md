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
