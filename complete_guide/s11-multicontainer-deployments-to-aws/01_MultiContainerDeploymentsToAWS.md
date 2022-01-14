# Multi-Container Deployments to AWS

## Multi-Container Definition Files

* After pushing code to TravisCI, we want to push code to Amazon Elastic Beanstalk.
* Whenever you have multiple Dockerfiles, we have to tell Elastic Beanstalk how to treat our project.
* The old way to do this was to add a `Dockerrun.aws.json` file. This is different now with the new AWS Linux 2 images.
