# Preparing a Multi-Container App

1. We're not using docker-compose for deployment
2. Create backend image
   1. In ECS, you cannot use the name resolving service. Edit `mongodb` container name in app.js. 
      1. When deploying as the same task, you can use `localhost` since ECS guarantees they run on the same container.
   2. `docker build -t goals-node .`
   3. `docker tag goals-node rommelrico/goals-node`
   4. `docker push rommelrico/goals-node`
3. On ECS, Create Cluster
4. Networking Only
5. Provide name. Create VPC (leave defaults). Create.
6. Wait a few minutes.
7. View Cluster.
8. Task Definitions > Create New Task Definition > Fargate
9. Provide name. Task Role select ecsTaskExecutionRole. 
10. Add container goals-backend. Use Docker Hub name. Map port 80.
11. Under environment, add `node,app.js`
12. Under environment variables, add environment variables (3 total). For MONGODB_URL, set the value to `localhost`.
13. Click add.
14. For MongoDB, add a new container to same Task
15. Enter name and Image `mongo`. For port, map 27017.
16. For environment variables, add environment variables (2 total).
17. Click add.
18. Click Create.
19. Clusters > goals-app > Services > Create
20. Select Fargate and new Task Definition we just created
21. Number of Tasks = 1, service name = goals-service, Click Next
22. Use the VPC that was created with your cluster. Add subnets. Auto-assign IP. Application Load Balancer. 
23. Click EC2 Console > Create Application Load Balancer > Any name, internet facing, expose port 80, same VPC > Next
\> Next > Next > IP Target type > Next > Next > Create
24. Go back to ECS. Refresh. Select Load balancer and map it to port 80.
25. Click Next > Next > Create Service.

