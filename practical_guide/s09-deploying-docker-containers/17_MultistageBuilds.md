# Multi-stage builds

* One docker file, multiple build / setup steps (stages)
* Stages can copy results (created files and folders) from each other
* You can either build the complete image or select individual stages

## Building a Multi-stage pipeline

1. Make a new public repository on Docker Hub.
2. Build and tag
3. Push to Docker Hub.
