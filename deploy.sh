docker build -t hoier14/multi-client:latest -t hoier14/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hoier14/multi-server:latest -t hoier14/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hoier14/multi-worker:latest -t hoier14/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push hoier14/multi-client:latest
docker push hoier14/multi-client:$SHA
docker push hoier14/multi-server:latest
docker push hoier14/multi-server:$SHA
docker push hoier14/multi-worker:latest
docker push hoier14/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=hoier14/multi-client:$SHA
kubectl set image deployments/server-deployment server=hoier14/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=hoier14/multi-worker:$SHA