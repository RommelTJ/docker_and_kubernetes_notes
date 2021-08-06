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
