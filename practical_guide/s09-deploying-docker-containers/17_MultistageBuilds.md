# Multi-stage builds

* One docker file, multiple build / setup steps (stages)
* Stages can copy results (created files and folders) from each other
* You can either build the complete image or select individual stages

## Building a Multi-stage pipeline

1. Make a new public repository on Docker Hub.
2. Build and tag
3. Push to Docker Hub.
4. Go to Task Definitions on ECS, add container, select new image from Docker Hub.
5. Map port 80
6. Startup Dependency Ordering, make backend run first before frontend.
7. Click Add.
8. Click Create. Can't because two containers are pointed to port 80.
9. Make new Fargate Task Definition, add goals react container. Map to port 80. 
10. Click Add.
11. Click Create.
12. Add a new load balancer for the frontend and add it to the same VPC as the other load balancer.
13. Target IP
14. Create load balancer
15. Get URL for load balancer (DNS name).
16. Add it to your environment variables for backend.
17. Redeploy with updated source code
18. Create service with updated container.
19. Update and start.

