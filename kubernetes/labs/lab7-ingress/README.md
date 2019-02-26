## Chapter 7 - Ingress controllers - Access from the Outside

Ingress Controllers are responsible for managing access to the cluster services. This is exactly what we need.

Ingress is an addon and needs to be enabled first
```
#may need to create this first
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
#show the list of addons
minikube addons list
#ensire ingress is enabled
minikube addons enable ingress
```
#### Ingress Controller
How do expose it externally?

https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-ingress-guide-nginx-example.html

To avoid hardcoding IP in the frontend use ingress
 https://www.orange-networks.com/blogs/210-ingress-controller-simplified-routing-in-kubernetes

 Using ingress controller
 https://github.com/rinormaloku/k8s-mastery/tree/ingress-controller

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

https://medium.com/@awkwardferny/getting-started-with-kubernetes-ingress-nginx-on-minikube-d75e58f52b6c
