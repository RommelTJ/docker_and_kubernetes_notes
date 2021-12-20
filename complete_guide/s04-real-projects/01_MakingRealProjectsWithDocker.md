# Making Real Projects with Docker

## Project Outline

Making a little NodeJS Web App working inside a Docker Container.

Steps: 
1. Create NodeJS Web App
2. Create Dockerfile
3. Build image from Dockerfile
4. Run image as container
5. Connect to web app from a browser

## Node Server Setup

Added "simpleweb" app.

## A Few Planned Errors

* Need to execute "npm install" and "npm start".
* Created Dockerfile.
* `docker build .`
* "npm: not found"

## Base Image Issues

* Alpine doesn't include a lot of programs by default. NPM is not one of them.
  * We can find a different base image, or
  * We can install what we need.
  * We set to the node image: `node:alpine`
  * In the docker world, "alpine" = minimal image.
* `docker build .`
  * Error with npm install. "ENOENT: no such file or directory, open '/usr/app/package.json'"
