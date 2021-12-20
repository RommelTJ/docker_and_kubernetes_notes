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

## A Few Missing Files

* We need to copy the package.json.
  * `COPY package.json .`

## Copying Build Files

```
COPY package.json .
```

or
```
COPY package.json /usr/app/
```

## Container Port Mapping

Dockerfile:  
```
EXPOSE 8080
```

`-p <PORT1>:<PORT2>`  
* PORT1 = The port on your local machine.
* PORT2 = The port inside the container.

```
docker build -t rommelrico/simpleweb .
docker run -p 5001:8080 rommelrico/simpleweb
```

## Specifying a Working Directory

Shell:  
```
docker run -it rommelrico/simpleweb sh
ls
```

Don't want to write directly to the root project directory because it can overwrite system files.

In Dockerfile:  
```
WORKDIR /usr/app
```

Checking that docker image and container have changed to the WORKDIR:  
```
docker ps
docker exec -it fe7c39048519 sh
ls
```

## Unnecessary Rebuilds

You have to rebuild to get new changes:  
```
docker run -p 8080:8080 rommelrico/simpleweb
<Make a change in index.json>
<Refresh page, no changes>
docker build -t rommelrico/simpleweb .
docker run -p 8080:8080 rommelrico/simpleweb
```

Note that Step 3, 4, 5 are no longer cached because we modified the index.js.

## Minimizing Cache Busting and Rebuilds

See changes in Dockerfile.   
We minimized cache busting by separating the files that don't change from the ones that do.  

```
docker build -t rommelrico/simpleweb .
docker run -p 8080:8080 rommelrico/simpleweb
```
