## Microservices, Docker, Kubernetes

#### Story

10 years ago you were tasked with writing a web application that performs sentiment analysis. This application takes as input one sentence and says whether the sentence is saying something positive or something negative. Back then everybody was building traditional server side MVC applications so you did the same thing and picked Spring MVC to develop the application.

Fast forward 5 years and now everybody builds Single Page Web applications and obviously want their applications to look good on Mobile Devices. So how do you adapt to this new world? Well ... you can still use Spring MVC for the back end but now the functionality needs to be exposed via REST endpoints instead of serving HTML content. These REST endpoints are in turn used by your new shiny React Front end, that uses Bootstrap to handle Responsive Web Design.

Fast forward another 2 years and now every problem is a Machine Learning problem so everybody needs to use ML or DL to look cool. The challenge is that that you need to use Python to benefit from the best ML libraries. Now the application has JavaScript on the front end, Java on the Web serving layer and Python on the back end. The application evolved from using Java across the entire stack to using 3 distinct technologies maintained by 3 teams working across 3 different continents. Now you need to figure out how to develop and deploy these components independently.

Because of the new Machine Learning library the application became an instant success and you need to scale it. From an initial benchmarking it seems that sentiment analysis has the highest load while the Web serving component experiences medium load. Also it turns out the application cannot have downtime anymore because that translates into lost revenue. So you need to figure out how to scale each of these components independently with zero downtime.

These are the problems that we will try to solve during this workshop.

#### Goals
In this workshop we are going to learn about the following:
* Why do we need micro-services?
  * problems they solve
  * problems they create
* Docker Containers
  * how they relate to micro-services
  * basics of Docker and Docker files
* Container orchestration with Kubernetes
  * why Kubernetes  
  * scaling micro-services independently
  * zero downtime deployments

### Prerequisites
To follow along in this workshop the following have to be installed
* git
* Docker Machine
* Minikube

#### Chapter 0
Now the saga begins ...

I am not going to bore you with creating an MVC application. As a starting point we are going to use an application that is already split into 3 components. For most of this workshop I am going to follow this [excellent introduction to Kubernetes](https://medium.freecodecamp.org/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882)

Download the following repository

```
git clone https://github.com/rinormaloku/k8s-mastery.git
```

The application consists of 3 micro-services
* SA-Frontend serves React JS files
* SA-WebApp handles request from front end
* SA-Logic performs sentiment analysis

#### Chapter 1 - Setting up the development environment
This explains why it is beneficial to set up a development environment based on Docker Containers
#### Chapter 2 - It's all about containers
This explains how to build the application components as Docker images
#### Chapter 3 - Running multi container applications locally
This introduces Docker Compose and show how to improve the experience of running an application that consists of multiple Docker containers

#### Kubernetes
Kubernetes
* Q; How do we scale containers?
* Q: What if the server is full cannot run another container?
* Q: How do we balance the load between containers?
* Q: How do we do rolling updates? How we go back to a previous version if something goes wrong?

### basic concepts
* Master node - API server - kubectl
* Worker nodes - kubelet, Pods

#### Pods
* smallest deployable unit
* has a unique IP address in a Kubernetes cluster
* a pod can have multiple containers but that is rather unusual.
* containers in a pod share the same volume, IP, port space
* pods can be used with other technologies like RKT

#### Services
How do we load balance between them?

In our application we have different functional services. So how does a service which pods to load balance? This is done using labels.
* Apply a label to all services we want to target
* Apply a selector to our services so that defines which labeled pods to target

#### Deployments
Start multiple pods for Frontend

#### Ingress Controller
How do expose it externally?

To avoid hardcoding IP in the frontend use ingress
 https://www.orange-networks.com/blogs/210-ingress-controller-simplified-routing-in-kubernetes

 Using ingress controller
 https://github.com/rinormaloku/k8s-mastery/tree/ingress-controller



===========================
https://www.backblaze.com/blog/vm-vs-containers/

Best practices for running Docker and Node
https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

Dependencies:
* sa-frontend - npm
* sa-webapp jdk8 and mvn
* sa-logic python3 and pip


Running in Docker
* Create a docker container for each of the microservices
  * Build context and .dockerignore
* Publish in Docker hub
* Run the application

Now that we have multiple containers we need some sort of orchestration.
Kubernetes is a Container Orchestrator that provides a layer of abstraction over the underlying infrastructure

https://github.com/iMarcoGovea/books

https://blog.getambassador.io/kubernetes-ingress-nodeport-load-balancers-and-ingress-controllers-6e29f1c44f2d
https://blog.getambassador.io/from-monolith-to-service-mesh-via-a-front-proxy-learnings-from-stories-of-building-the-envoy-333711bfd60c
