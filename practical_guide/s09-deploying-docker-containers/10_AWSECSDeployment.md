# Deploying with AWS ECS: A Managed Docker Container Service

1. Go to AWS ECS
2. Select Custom (how docker run will execute this container). 
   1. Give it a name
   2. Select the image from Docker Hub
   3. Map the ports
   4. Configure any other options.
   5. Update
3. Define a Task. How it should launch the container. Think of them as a remote machine that may run 
one or more containers. Click Next.
4. Define a Service. How the task and container should be executed. For example, if you wanted to add
a load balancer. Click Next.
5. Configure Cluster. The overall network. Click Next.
6. Click Create.
7. Wait a few minutes.
8. View Service.
9. Get the IP from the Task and you're good!

## More on AWS

There's more resources on academind.com.

## Updating Managed Containers

1. Make a change.
2. Run docker build.
3. Tag it again.
4. Push to Docker Hub.
5. Go to Clusters > Defaults > Task Definition
6. Create new revision. Keep everything the same. Click Create. AWS ECS will use the latest version automatically.
7. Actions > Update Service > Review> Update Service
