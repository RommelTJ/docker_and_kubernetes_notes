# Working with Environment Variables & .env files

Docker supports built-time ARGuments and runtime ENVironment variables.
-> ARG: Available inside of Dockerfile, NOT accessible in CMD or any application code
-> Set on image build (docker build) via --build-arg

-> ENV: Available inside of Dockerfile AND in application code.
-> Set via ENV in Dockerfile or via --env on docker run.

```shell
docker run -d -p 3000:8000 --env PORT=8000 --rm --name feedback-app -v feedback:/app/feedback -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s03-managing-data/data-volumes-example:/app:ro -v /app/temp -v /app/node_modules feedback-node:env

docker run -d -p 3000:9000 --env-file ./.env --rm --name feedback-app -v feedback:/app/feedback -v /Users/rommel/Documents/github/play/docker_and_kubernetes/docker_and_kubernetes_notes/practical_guide/s03-managing-data/data-volumes-example:/app:ro -v /app/temp -v /app/node_modules feedback-node:env
```
