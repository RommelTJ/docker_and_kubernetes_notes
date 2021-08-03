# Preparing a Multi-Container App

1. We're not using docker-compose for deployment
2. Create backend image
   1. In ECS, you cannot use the name resolving service. Edit `mongodb` container name in app.js. 
      1. When deploying as the same task, you can use `localhost` since ECS guarantees they run on the same container.
   2. `docker build -t goals-node .`
   3. `docker tag goals-node rommelrico/goals-node`
   4. `docker push rommelrico/goals-node`
