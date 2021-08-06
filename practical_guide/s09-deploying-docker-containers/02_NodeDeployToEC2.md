# Getting started with an Example

AWS EC2 is a service that allows you to spin up and manage your own remote machines.

Steps:
1. Create and launch EC2 instance, VPC and security group
2. Configure security group to expose all required ports to WWW
3. Connect to instance (SSH), install Docker and run container

## Docker Commands

```shell
docker build -t node-dep-example .
docker run -d --rm --name node-dep -p 80:80 node-dep-example
```
