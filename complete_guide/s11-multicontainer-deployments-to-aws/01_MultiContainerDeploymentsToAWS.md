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

## Managed Data Service Providers

* In `Dockerrun.aws.json`, we did not specify a container for Postgres or Redis.
* This leads to discussion on databases inside containers.
* Architecture for production:
  * Redis will run separately in AWS Elastic Cache (EC).
  * Postgres will run separately in AWS Relational Database Service (RDS).

Advantages to using AWS Elastic Cache
* Automatically creates and maintains Redis instances for you.
* Super easy to scale.
* Built-in logging + maintenance.
* Probably better security than what we can do ourselves.
* Easier to migrate off of EB with.

Advantages to using AWS Relational Database Service
* Automatically creates and maintains Postgres instances for you.
* Super easy to scale.
* Built-in logging + maintenance.
* Probably better security than what we can do ourselves.
* Automated backups and rollbacks.
* Easier to migrate off of EB with.

## Overview of AWS VPCs and Security Groups

* By default, when we create an EB instance, the services won't be able to communicate to RDS or EC.
* We have to form a very distinct link between the services.
* This is done via VPCs and Security Groups.
* The AWS EB instance was created in a specific region and Virtual Private Cloud (VPC).
* AWS Console > Services > VPC
* To allow services to communicate with each other, you must set up a Security Group (Firewall rules).
  * Ex: Allow any incoming traffic on Port 80 from any IP.
  * Ex: Allow traffic on Port 3010 from IP 172.0.40.2.
* To look up your security group:
  * VPCs > Security Group > complex-docker-env
  * By default, allows traffic from anywhere to Port 80.
  * By default, outbound traffic is set to allow all.
* We want to create a new security group that says:
  * Allow any traffic from any other AWS service that has this security group
  * And then we want to attach it to our EB Instance, our RDS service, and our EC service.

## RDS Database Creation

Setting up RDS instance on AWS: `complex-docker-postgres`.
Database name: `fibvalues`.
