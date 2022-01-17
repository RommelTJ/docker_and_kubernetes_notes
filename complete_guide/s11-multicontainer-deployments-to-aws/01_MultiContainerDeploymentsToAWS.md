# Multi-Container Deployments to AWS

## Multi-Container Definition Files

* After pushing code to TravisCI, we want to push code to Amazon Elastic Beanstalk.
* Whenever you have multiple Dockerfiles, we have to tell Elastic Beanstalk how to treat our project.
* The old way to do this was to add a `Dockerrun.aws.json` file. This is different now with the new AWS Linux 2 images.

## Finding Docs on Container Definitions

* Elastic Beanstalk -> Amazon Elastic Container Service (ECS)
* ECS runs based on task definitions.
* Task definitions tell Amazon how to run a single container.
* Documentation
  * https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html
    * Task Definition Parameters: 
      * https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
    * Container Definitions: 
      * https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#container_definitions

## Adding Container Definitions to DockerRun

* Added `Dockerrun.aws.json` file.
* Added container definitions for each service.
* On amazon, at least one container definition must be essential.
* For the nginx container, we also have to specify links to network ECS containers.

## Creating the EB environment

Setting up the EB Environment on AWS.
* App name: `complex-docker`
* Environment: `complex-docker-env`
