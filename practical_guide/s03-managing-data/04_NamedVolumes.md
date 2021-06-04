# Named Volumes

List all volumes docker is managing: 
```shell
docker volume ls
```

Named volumes are not deleted if a container is shutdown.

```shell
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback  feedback-node:volumes
```

To create a named volume, add the `-v <NAME>:<Container_path>`

