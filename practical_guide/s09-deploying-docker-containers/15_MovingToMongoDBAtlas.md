# Moving to MongoDB Atlas

1. Start free > Create account
2. Build Cluster
3. Shared Cluster
4. Select AWS Cloud Provider and Default settings
5. Click Connect
6. Add connection string from Mongo Atlas to our `app.js`
7. Decide if you want to use Atlas for development or use your own mongo container
8. We want to use Atlas for both dev and prod.
9. Update docker-compose to use atlas. Remove the mongodb service.
10. In backend.env, update the MONGODB_URL.
11. Remove volumes from docker-compose.
12. Remove mongo.env file.
13. Remove depends_on mongodb.
14. Go to MongoDB Atlas to whitelist IP addresses under Network Access
15. Go to MongoDB Atlast, under Database Access, set a user and password for the DB
16. Update backend.env file with new user/pass.
17. Build image again. Run.

## Using MongoDB Atlas in Production

1. In ECS, Task Definitions > latest > New revision
2. Remove mongodb container
3. Remove volume
4. Remove EFS resources
5. Remove Security Group for EFS
6. Update backend container. Update MONGODB Environment variables.
7. Click Update
8. Click Create
9. Redeploy service
10. Rebuild image
11. Push to Docker Hub
12. Update service in ECS
