## Chapter 6 - Kubernetes Deployments - Scalability and Zero Downtime Deployments

At this point we have a Load Balancer and a single pod but when I talked about Kubernetes I said it allows the application components to be scaled independently. This is where Kubernetes Deployments help. They allow us to scale and to do much more.

Managing pods directly is not a good idea. If a pod dies it is our responsibility to create a replacement and that is no fun.

#### Front End Deployment
Deployments are defined - surprise! - using yaml manifest files. Let's review the front end deployment.

* Replicas tells us how many pods to run
* template - the pod template used by the deployment
* label  - needs to match the label used by the Load Balancer

```
#from lab6 deployment directory
kubectl apply -f sa-frontend-deployment.yaml
#check the pods are running
kubectl get pods
#check if the load balancer uses the new pods
kubectl describe svc sa-frontend-lb
```
Let's see what happens if we delete the pods

```
#delete pod created by the deployment
kubectl delete pod sa-frontend-name-from-get-pods
#delete pod created manually
kubectl delete pod sa-frontend
kubectl get pods
```

Cool! So if a deployment pod dies - the deployment recreates it. Manually created pods don't come back as expected.
**Question:** How do we scale to 3 frontends?

#### Zero downtime deployments
The rest of the deployment configuration file specifies how we want to deploy a new version of the code. It gradually shuts down pods running the olds version and replaces them with new ones. Let's how this works in practice.

Let's change the the image in the frontend deployment from mihailrc/sa-frontend to mihailrc/sa-frontend:cool
```
#apply the changes
kubectl apply -f sa-frontend-deployment.yaml --record
#verify deployment status
kubectl rollout status deployment sa-frontend
```
Our update is live - this is pretty cool!

#### Rolling back a deployment
But wait! How did this get promoted to production - it does not look Cool at all. We need to roll it back.

That turns out to be embarrassingly easy in Kubernetes
```
#view deployment history first
kubectl rollout history deployment sa-frontend
#revert to a previous state
kubectl rollout undo deployment sa-frontend --to-revision=1
```

That's about it! It does not get simpler than that.

#### Deployment of the entire application
Just apply all the configurations from the current directory.
```
kubectl apply -f .
```

Let's try it out. Ooh no! We have another problem.
When we build the React application we used localhost for the URL. Obviously that is not going to work so let's fix it.

The local host was indeed a problem that we had to solve anyway. The actual problem is that the front end tries to access the web app and does not know how to get to it. One approach is to figure out the URL of the webapp and hardcode it into the front end. This sounds like the approach we used for Docker containers and we did not like it at all. The solution is provided by ingress controllers.
