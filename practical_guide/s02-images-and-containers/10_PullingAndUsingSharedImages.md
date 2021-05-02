# Pulling and Using Shared Images

```shell
docker images prune -a
docker images
docker logout
docker pull rommelrico/nodejs-app-test
docker run -p 8000:3000 -d --rm rommelrico/nodejs-app-test
```

When you execute pull, docker will be default pull the latest image.

You can also try 
`docker run rommelrico/nodejs-app-test`

If the image doesn't exist locally and you're logged in to DockerHub, 
it will try to find it and pull that for you.

However, it won't automatically check for updates if you already pulled it.
For that you need to pull first.
