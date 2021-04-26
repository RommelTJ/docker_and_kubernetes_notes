# Assignment

Dockerize BOTH apps - the Python and the Node app.

1) Create appropriate images for both apps (two separate images!).
   HINT: Have a brief look at the app code to configure your images correctly!

2) Launch a container for each created image, making sure,
   that the app inside the container works correctly and is usable.

3) Re-create both containers and assign names to both containers.
   Use these names to stop and restart both containers.

4) Clean up (remove) all stopped (and running) containers,
   clean up all created images.

5) Re-build the images - this time with names and tags assigned to them.

6) Run new containers based on the re-built images, ensuring that the containers
   are removed automatically when stopped.

## Solution

```shell
cd ../assignment/node-app/
docker build .

cd ../python-app/
docker build .

docker run -p 3000:3000 -d 0097f9e8c60a
docker run -it 3b318c0bf86d

docker run -p 3000:3000 --name assignmentapp 0097f9e8c60a
docker run -it --name assignmentapp2 3b318c0bf86d
docker stop assignmentapp2

docker container prune

docker build -t assignmentnode:latest .
docker build -t assignmentpython:latest .

docker run -it --rm --name assignmentcontainer2 assignmentpython:latest
docker run -d -p 3000:3000 --rm --name assignmentcontainer1 assignmentnode:latest
docker stop assignmentcontainer1
```
