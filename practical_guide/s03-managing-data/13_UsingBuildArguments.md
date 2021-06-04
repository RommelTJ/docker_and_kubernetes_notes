# Using Build Arguments (ARG)

We can set a dynamic argument using args.

```shell
docker build -t feedback-node:web-app .

docker build -t feedback-node:web-app --build-arg DEFAULT_PORT=8000 .
```
