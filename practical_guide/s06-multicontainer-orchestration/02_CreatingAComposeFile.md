# Creating a Compose file

Create a `docker-compose.yaml` and describe your environment.  
See: https://docs.docker.com/compose/compose-file/  

By default, when you use docker compose your services will be removed.  
Detached mode doesn't have to specify on each service since it's specified at 
the end.

You need a dash whenever you have a single value. 
If you have key-value pairs, you don't need dashes.

By default, you don't need to specify a network since docker-compose will
organize things for you.
