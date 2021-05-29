# Bind Mounts

Volumes are managed by Docker and we don't know where they are.  
With Bind Mounts we set the path for the folder/path on the host machine.  

Bind Mounts are perfect for persistent, editable data.  

To set up:
```shell
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s03-managing-data/data-volumes-example:/app feedback-node:volumes
```
