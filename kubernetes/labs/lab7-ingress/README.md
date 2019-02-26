## Chapter 7 - Ingress controllers - Access from the Outside

Ingress Controllers are responsible for managing access to the cluster services. This is exactly what we need.

Ingress is an addon and needs to be enabled first
```
#may need to create this first
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl get configmap -n ingress-nginx
#show the list of addons
minikube addons list
#ensire ingress is enabled
minikube addons enable ingress
```
https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-ingress-guide-nginx-example.html
