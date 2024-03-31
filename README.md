
# Assignment

I followed the following steps to complete the Assignment




## Steps Taken

1. Install Minikube
2. Get node exporter on minikube
3. Create bash file
4. create dockerfile
5. Build image and push to dockerhub
6. Create pv and pvc
7. Create cron Job yaml
8. Create accesspod
9. Challenges


## Step 1: Install minikube 

The first step is to create a minikube cluster using  the following commands :

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

Command to start the cluster :
minikube start

Next step is to use kubectl. We can install kubectl or Alternatively, minikube can download the appropriate 
version of kubectl and we should be able to use it like this:
alias kubectl="minikube kubectl --" :

verify installation:
minikube kubectl -- get po -A

## Step 2: Get node exporter on minikube

I deployed the node exporter to collect the metrics by following the steps mentioned in the following link:
https://devopscube.com/node-exporter-kubernetes/

Note: Make sure that the daemonset and service are deployed in the correct namespace.

## Step 3: Create bash file

I tried to create a bashfile and execute it on local machine first. When it was successful I used it in a dockerfile.
Command to run the bashscript "./getMetricsScript.sh"
## Step 4: Create a Dockerfile

Command To create a Dockerfile:
vi Dockerfile 
## Step 5: Build image and push to dockerhub

We need to create a docker repository first on dockerhub: 
https://hub.docker.com/
Then we need to login to our account on docker hub from the terminal using credentials Command to login is: 
docker login

The command to build the image is:
docker build -f Gauri/Dockerfile --force-rm -t gaurir211/assignment:017 .

The command to push the image is:
docker push gaurir211/assignment:017

The image is now ready to  be used. We will use it in our cronJob yaml file.
## Step 6: Create persistent volume and persistent volume claims
We need to Treat the output files generated as essential and should be retained on pod restarts. So we will do this with the help of persistent volume and persistent volume claims

kubectl apply -f mypv.yaml
kubectl apply -f mypvc.yaml
## Step 7: Create cron Job yaml

Create the CronJob.yaml and deply it on the kubernetes cluster.
kubectl apply -f cron.yaml

Note:
a. Cron has the following syntax - * * * * * command_to_execute 
Minute (0-59)
Hour (0-23)
Day of the month (1-31)
Month (1-12 or names, e.g., January, February)
Day of the week (0-7 or names, 0 and 7 both represent Sunday)
b. In our case we are running the cron every minute.
c. Use the correct Persistent volume claim.


## Step 8: Create accesspod

I am creating another pod to access the volume mounted by cron job. We can achieve this using the same Persistent volume claim as
is used by the cronjob. We will be able to exec to the pod and test the volume folder and files created. 

Command to deploy the pod:
kubectl apply -f accesspod.yaml

command to exec into the pod:
kubectl exec -it busybox -- sh

command to Verify cron files:
cd /metrics
ls -l
## Step 9: Challenges:

Deploying  the node exporter. I used traditional method at first and then came up with daemonset and service idea.

