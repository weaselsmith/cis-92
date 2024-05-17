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

## Postgres Values

| Variable Name | Default Value | Description |
| -- | -- | -- |
| username | mysiteuser | username for SQL database |
| password | this-is-a-bad-password | password for initial database user |
| database | mysite | name of database |

## Deployment

execute these commands in repository home to deploy application

1. set up kubernetes pod and postgres database
```
helm install postgres oci://registry-1.docker.io/bitnamicharts/postgresql --values values-postgres.yaml

kubectl apply -f deployment/
```
2. initialize mysite
```
kubectl exec --stdin --tty pod/mysite-pod -- /bin/bash
python manage.py migrate
python manage.py createsuperuser
```

Easy as that, you will have the site up and running!

You can find the external ip that is hosted on with `kubectl get service/django-svc`

## Deleting Mysite

here are the commands to delete the application:

```
kubectl delete deployment.apps/mysite-deployment cm/mysite-config secret/mysite-secret service/django-svc

helm uninstall postgresql
```
