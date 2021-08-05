# Our Current Architecture

* AWS ECS
  * ECS Task
    * NodeJS REST API container
    * MongoDB container
      * Volume implemented with AWS EFS Storage
* AWS Load Balancer reaches out to containers

## Database and Containers: An important consideration

* You can absolutely manage your own database containers
* Scaling and managing availability can be challenging
* Performance (especially during traffic spikes) could be bad
* Taking care about backups and security can be challenging
* Consider using a managed Database Service (e.g. AWS RDS, MongoDB Atlas, etc).
