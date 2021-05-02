# Sharing via Docker Hub or Private Registry

## DockerHub

The official docker image registry. Free to start. Has paid features.

Share: `docker push <IMAGE_NAME>`  
Use: `docker pull <IMAGE_NAME>`

Ex:  
`docker push rommelrico/nodejs-app-test`

Renaming a tag:  
`docker tag node:latest rommelrico/nodejs-app-test:latest`

Login:  
`docker login`

## Private Registry

Will cover more during deployment.

If you want to push/pull to a private registry, you have to format the `<IMAGE_NAME>`
as `<HOST:IMAGE_NAME>`.

