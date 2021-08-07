# Getting Started With Kubernetes

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications.

## Issues with Manual Deployment

* Manual Deployment of Containers is hard to maintain, error-prone and annoying
  * Even beyond security and configuration concerns!
* Containers might crash / go down and need to be replaced
* We might need more container instances upon traffic spikes
* Incoming traffic should be distributed equally

## Why Kubernetes?

* AWS ECS and other managed container services will help with a lot of issues with manual deployment
* But that locks us in!
* Using a specific cloud service locks us into that service
* You need to learn the specifics for AWS ECS, services and configs and if we wanted to switch we would have to
translate them to another provider
* Just knowing Docker isn't enough!
* Might be fine if you just want to stick with one provider
