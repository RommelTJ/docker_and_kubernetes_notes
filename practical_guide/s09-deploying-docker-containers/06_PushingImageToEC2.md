# Pushing our local image to the cloud

## Option 1: Deploy Source Code
1. Build image on remote machine.
2. Push source code to remote machine.
3. Run docker build and then docker run.
4. More complex.

## Option 2: Deploy Built Image
1. Build image before deployment.
2. Run docker run.
3. Avoid unnecessary remote server work.

## Executing Option 2
1. Go to Docker Hub.
2. Create a new repository in Docker Hub.
3. Build the image locally and tag it with the Docker Hub name: `docker tag example-1 rommelrico/example-1`
4. Run `docker login`
5. Run `docker push rommelrico/example-1:latest`
