# How Docker Resolves IP Addresses

You can use `host.docker.internal` to target the host machine.

Or you can use a docker network and use the name of the container to 
automatically resolve the IP Address of a container.

Docker does not replace your source code. 
It simply detects outgoing requests and resolves any IP for such requests.
