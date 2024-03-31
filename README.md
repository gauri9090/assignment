# assignment

docker build -f Gauri/Dockerfile --force-rm -t gaurir211/assignment:017 .

docker push gaurir211/assignment:017

kubectl exec -it busybox -- sh
