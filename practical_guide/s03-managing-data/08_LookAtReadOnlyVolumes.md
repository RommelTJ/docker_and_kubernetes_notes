# A Look at Read-Only Volumes

You can mark a volume as "ro" to make it read-only.  
If you specify a subvolume, then it takes priority over other paths.

```shell
docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v /Users/rommel/Documents/github/pl
ay/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s03-managing-data/data-volumes-example:/app:ro -v /app/temp -v /app/node_modules feedback-node:volumes
```
