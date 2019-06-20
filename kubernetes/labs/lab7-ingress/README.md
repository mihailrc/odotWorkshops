## Chapter 7 - Ingress controllers - Access from the Outside

Ingress Controllers are responsible for managing access to the cluster services. This is exactly what we need.

Ingress is an addon and needs to be enabled first
```
#show the list of addons
minikube addons list
#ensire ingress is enabled if not enable it
minikube addons enable ingress
#create all the resources
kubectl apply -f .
```
https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-ingress-guide-nginx-example.html
