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
