docker build -t rommelrico/multi-client -f ./client/Dockerfile ./client
docker build -t rommelrico/multi-server -f ./server/Dockerfile ./server
docker build -t rommelrico/multi-worker -f ./worker/Dockerfile ./worker
docker push rommelrico/multi-client
docker push rommelrico/multi-server
docker push rommelrico/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rommelrico/multi-server
