# A Continuous Integration Workflow for Multiple Images

## Production Multi-Container Deployments

Single container setup: 
* Push code to GitHub
* Travis automatically pulls repo
* Travis builds an image, tests code
* Travis pushes code to AWS EB
* EB builds image, deploys it

Multi-Container Setup:  
* Push code to GitHub
* Travis automatically pulls repo
* Travis builds an image, tests code
* Travis builds **prod** images
* Travis pushes built **prod** images to Docker Hub
* Travis pushes project to AWS EB
* EB pulls images from Docker Hub, deploys

## Production Dockerfiles

Set up production versions for all of our Dockerfiles.dev files.

## Multiple Nginx Instances

Setting up multiple Nginx instances for production.  
Remember that Nginx is being used for routing.  

## Altering Nginx's Listen Port

* Added a client-specific nginx/default.conf
* Set up Dockerfile correctly

## Cleaning up Tests

In a real scenario, we would add a mocking module. Out of scope, so we comment out the test.

## GitHub and TravisCI Setup

* Set up https://github.com/RommelTJ/multi-docker-example
* Set up https://app.travis-ci.com/github/RommelTJ/docker-react-example

## Travis Configuration Setup

Added `.travis.yml` file to:
* Specify docker as a dependency
* Build test version of React project
* Run Tests
* Build prod versions of all projects
* Push all to DockerHub
* Tell Elastic Beanstalk to update

## Pushing Images to DockerHub

* `docker login`
* Added docker login environment variables to TravisCI website.
* Updated `.travis.yml` to log in to docker.
  * `echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin`
* Push images to DockerHub.

## Successful Image Building

* Verified this all worked on TravisCI and images got uploaded to DockerHub.
