# My CIS-92 Project 

Django App with Docker and Kubernetes deployment

Author: Noah Panec

## Environment Variables

| Variable Name | Default Value | Description |
| -- | -- | -- |
| STUDENT_NAME | "Noah Panec" | Name to appear on site |
| SITE_NAME | "Django Unchained" | Title of site |
| DATA_DIR | /data | Tells django where to get data from host |
| DEBUG | 1 | Toggles django's debug mode |
| PORT | 8000 | The host port that the site runs on |
| SECRET_KEY | "this-is-a-bad-key" | cryptographic signing key |

## Deployment

execute these commands in repository home to deploy application

```
kubectl apply -f deployment/config.yaml
kubectl apply -f deployment/secret.yaml
kubectl apply -f deployment/service.yaml
kubectl apply -f deployment/pod.yaml
```

Easy as that, you will have the site up and running!

Database should be initialized by the Dockerfile

You can find the external ip that is hosted on with `kubectl get service/django-svc`

## Deleting Mysite

here are the commands to delete the application:

```
kubectl delete pod/django-pod
kubectl delete cm/mysite-config
kubectl delete secret/mysite-secret
kubectl delete service/django-svc
```
