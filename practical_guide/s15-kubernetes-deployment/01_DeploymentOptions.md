# Kubernetes Deployment (AWS / EKS)

## Deployment Options & Concepts

Kubernetes won't set up cloud resources. Minikube does it for us locally. 

* Custom Data Center
  * Install and Configure everything on your own
  * Setup your own machines
  * Setup Kubernetes Software
* Cloud Provider
  * Install + Configure most things on your own
    * Create + Connect machines
    * Install + Configure Software
    * Manually or via a tool like kops.
  * Use a managed service (EKS)
    * Define cluster architecture
    * Services like AWS EKS.

## AWS EKS vs AWS ECS

AWS EKS (Elastic Kubernetes Service)
* Managed service for Kubernetes deployments
* No AWS-specific syntax or philosophy required
* Use standard Kubernetes configurations and resources

AWS ECS (Elastic Container Service)
* Managed service for Container deployments
* AWS-specific syntax and philosophy applies
* Use AWS-specific configuration and concepts
