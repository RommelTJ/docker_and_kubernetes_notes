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

## Automated Deployments

Get AWS Access and Secret Keys from iam.

Created environment variables for TravisCI IAM user, access key, and access key on Travis CI.

## Exposing Ports through the Dockerfile

* After pushing to main, TravisCI pushes updates to Elastic Beanstalk.
* We need to expose the port.
  * With docker run, we manually expose the port (`-p 3000:3000`).
  * To expose the port in AWS EBS, we update the Dockerfile.prod with an `EXPOSE` instruction.

## Workflow with GitHub

* After pushing to main, TravisCI pushes updates to Elastic Beanstalk.
* Application is now deployed.
* Demonstrated the full flow.

## Redeploy on Pull Request Merge

* Pushed a change
* Created MR.
* Merged.
* Changes got deployed.

## Deployment Wrapup

* Checked that new feature got deployed.
* Note: Docker is not required in any of this workflow.
* Docker makes things easier.

## Environment Cleanup

1. Go to the Elastic Beanstalk dashboard.
2. In the left sidebar click "Applications".
3. Click the application you'd like to delete.
4. Click the "Actions" button and click "Delete Application"
5. You will be prompted to enter the name of your application to confirm the deletion.

## AWS Configuration Cheat Sheet

See Udemy.
