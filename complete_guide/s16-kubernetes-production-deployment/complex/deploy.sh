docker build -t rommelrico/multi-client:latest -t rommelrico/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rommelrico/multi-server:latest -t rommelrico/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rommelrico/multi-worker:latest -t rommelrico/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push rommelrico/multi-client:latest
docker push rommelrico/multi-server:latest
docker push rommelrico/multi-worker:latest

docker push rommelrico/multi-client:$SHA
docker push rommelrico/multi-server:$SHA
docker push rommelrico/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=rommelrico/multi-client:$SHA
kubectl set image deployments/server-deployment server=rommelrico/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=rommelrico/multi-worker:$SHA
