## Chapter 5 - Kubernetes Services - Reliability and Fault Tolerance

Kubernetes Pods are fungible. While a Pod gets its own address within the cluster, that address is not guaranteed to be stable. In our application we have a frontend component that depends on the webapp component, but how does the frontend keeps track of what webapp components are available? This is the problem that Kubernetes Services solve, it provides an access point to a logical set of pods that provide the same functionality. The set of Pods targeted by a Service is determined by a Label Selector.

**Question:** How do Kubernetes Services relate to micro-services?

Learn more about Kubernetes Services from [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/service/)

#### Creating a Load Balancer for the Front End
The load balancer is defined using a manifest file similar to the one used to define pods. Let's review the manifest file.

```
#from lab5-services directory
kubectl apply -f sa-frontend-lb.yaml
#to view services
kubectl get svc
#to get information about the front end load balancer.
kubectl describe svc sa-frontend-lb
```

We have a problem again! There are no endpoints so what is going on?
Hint: The Load Balancer uses a label selector to figure out what pods to track.

The issue is that the pod does not have any labels. So let's fix that. Go back to lab4 - uncomment the label and apply kubectl

Now our Service has an endpoint. Great! So let's try to access it. We have a problem again - the Load Balancer is running inside the Kubernetes cluster and we cannot access it directly. There are two ways of working around this problem.

```
minikube service list
```
This will show us the sa-frontend-url.

```
minikube service sa-frontend-lb
```
Opens up the frontent in the browser.
