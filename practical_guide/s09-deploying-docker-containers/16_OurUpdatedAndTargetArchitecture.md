# Our Updates and Target Architecture

## Current Architecture
* AWS ECS
    * ECS Task
        * NodeJS REST API container
          * MongoDB Atlas
* AWS Load Balancer reaches out to containers


## Target Architecture
* AWS ECS
    * ECS Task
      * React SPA
        * NodeJS REST API container
          * MongoDB Atlas
* AWS Load Balancer reaches out to containers

## Understanding a Common Problem

* Some apps / projects require a build step
  * Optimization script that needs to be executed AFTER development but BEFORE deployment
* Deployment and Production Setups are not equal
* We need to build first, then run the app in a server.

## Creating a "build-only" container

See Dockerfile.prod under frontend.
