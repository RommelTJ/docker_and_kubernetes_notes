# Continuous Integration and Deployment with AWS

## Services Overview

* GitHub - Free
* Travis CI - Free for OSS, but credit card required
* AWS - Free, but credit card required

## GitHub Setup

* Create GitHub repo
* Create local git repo
* Connect local git to GitHub remote
* Push work to GitHub

## Travis CI Setup

When we push from our laptop, we push to GitHub. TravisCI listens to changes, and then does work.

* Go to travis-ci.com
* Sign up
* TravisCI is sorta free for Open Source Software, but you need to provide credit card details.

## Travis YML File Configuration

Creating `.travis.yml` file:
* Tell Travis we need docker running
* Build our image using Dockerfile.dev
* Tell Travis how to run our test suite
* Tell Travis how to deploy our code to AWS.

## A Touch More Travis Setup

See `.travis.yml` script section.

## Automatic Build Creation

Commit the changes and see Travis CI.

## AWS Elastic Beanstalk

Set up things on AWS web console and updated yml files.

```
docker-compose -f docker-compose-dev.yml up
docker-compose -f docker-compose-dev.yml up --build
docker-compose -f docker-compose-dev.yml down
```

## More on Elastic Beanstalk

* AWS Environment gets setup
  * Automatically sets up a load balancer
  * Runs Virtual machine with Dockerized application inside a container.
* URL goes to AWS. Load balancer redirects to virtual machine running Docker.
* Benefit of Elastic Beanstalk is that it monitors traffic and can automatically add VMs to handle traffic.

## Travis Config for Deployment

See `.travis.yml`.
