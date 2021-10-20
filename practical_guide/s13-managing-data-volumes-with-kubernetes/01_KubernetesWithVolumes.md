# Kubernetes with Volumes

## Setup

1. `docker-compose up -d --build`

## Kubernetes and Volumes

State is data created and used by your application which must not be lost
* User generated data, user accounts, etc.
  * Often stored in databases but could also be files.
* Intermediate results derived by the app
  * Often stored in memory or temporary database tables or files.
* Volumes are needed to persist the data. This is why we use volumes.

### Volumes

Because we are still dealing with Containers!

* Kubernetes runs our Containers
* Kubernetes needs to be configured to add volumes to our containers
