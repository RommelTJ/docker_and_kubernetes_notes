# Our Current Architecture

* AWS ECS
  * ECS Task
    * NodeJS REST API container
    * MongoDB container
      * Volume implemented with AWS EFS Storage
* AWS Load Balancer reaches out to containers
