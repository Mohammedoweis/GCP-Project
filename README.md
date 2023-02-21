# GCP-finalProject

Deploy a python web application on GKE. this  is the repo of python app  https://github.com/atefhares/DevOps-Challenge-Demo-Code 

#### 1. Build image and upload to GCR

```
docker build -t <img-name> .
docker tag <img-name> gcr.io/<project-id>/<img-name>
docker push gcr.io/<project-id>/<img-name>
```

### 2. now we need to build infrastructure by 

cd infrastracure/
terraform init
terraform apply 


### 3.connect to private GKE cluster through bastion vm

gcloud compute ssh management-instance --tunnel-through-iap
gcloud container clusters get-credentials private-cluster --zone us-central1


### 4.deploy redis deploy and service u can find it on /k8s/app/
```
kubectl apply -f py-deploy.yaml
kubectl apply -f py-service.yaml
```