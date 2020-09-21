docker build -t bnagraja9099/multi-client:latest -t bnagraja9099/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t bnagraja9099/multi-server:latest -t bnagraja9099/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t bnagraja9099/multi-worker:latest -t bnagraja9099/multi-worker:$SHA -f ./worker/Dockerfile ./worker



docker push bnagaraja9099/multi-client:latest
docker push bnagaraja9099/multi-server:latest
docker push bnagaraja9099/multi-worker:latest

docker push bnagaraja9099/multi-client:$SHA
docker push bnagaraja9099/multi-server:$SHA
docker push bnagaraja9099/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=stephengrider/multi-client:latest
kubectl set image deployments/server-deployment server=bnagaraja9099/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=bnagaraja9099/multi-worker:$SHA

