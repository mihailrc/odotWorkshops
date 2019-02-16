## Microservices, Docker, Kubernetes

#### Story

10 years ago we were tasked with writing a web application that performs sentiment analysis. This application takes as input one sentence and says whether the sentence is saying something positive or something negative. Back then everybody was building traditional server side MVC applications so we did the same thing and picked Spring MVC to develop our application.

Fast forward 5 years and now everybody builds Single Page Web applications and obviously want their applications to look good on Mobile Devices. So how do we adapt to this new world? Well ... we can still use Spring MVC for the back end but now the functionality needs to be exposed via REST endpoints instead of serving HTML content. These REST endpoints are in turn used by our new shiny React Front end, that uses Bootstrap to handle Responsive Web Design for us.

Fast forward another 2 years and now every problem is a Machine Learning problem so everybody needs to use ML or DL to look cool. The challenge is that that we need to use Python to benefit from the best ML libraries. Now our application has JavaScript on the front end, Java on the Web serving layer and Python on the back end. The application evolved from using Java across the entire stack to using 3 distinct technologies maintained by 3 teams working across 3 different continents. Now now need to figure out how to develop and deploy these components independently.

Because of the new Machine Learning library our application became an instant success and we need to scale it up. From an initial benchmarking it seems that sentiment analysis has the highest load while the Web serving component experiences medium load. Also it turns out we cannot afford to have downtime anymore because that translates into lost revenue. So we need to figure out how to scale each of these components independently with zero downtime.

These are the problems that we will try to solve during this workshop.

#### Goals
In this workshop we are going to learn about the following:
* Why do we need micro-services?
  * problems they solve
  * problems they create
* Docker Containers
  * VM's vs Containers
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

#### Chapter 1
Now the saga begins ...

I am not going to bore you with creating an MVC application. As a starting point we are going to use an application that is already split into 3 components. For most of this workshop I am going to follow this [excellent introduction to Kubernetes](https://medium.freecodecamp.org/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882)

The application consists of 3 micro-services
* SA-Frontend serves React JS files
* SA-WebApp handles request from front end
* SA-Logic performs sentiment analysis


#### Setting up the development environment
For me the simplest way of defining Agile is take a small step towards solving a problem, learn from it, take the next step. To be Agile our development process has to enable quick feedback loops. One enabler of quick feedback loops is a lightweight development environment that can be reproduced easily and reliably.

One option is to do development directly on the local computer but that means I will need to install multiple libraries like npm, java, python and so on and I don’t really like cluttering my computer. There is the additional risk of configuration drift between different development machines so this does not seem like a good option.

Problem: How do we create an environment that is lightweight and does not clutter our computer?

Solution: We can use a docker container that has build dependencies installed.

Problem: But wait - what about  development tools like an IDE? They are not going to be available on the docker container and I don’t want to give this up.

Solution: A simple way of addressing this problem is to share a volume between the host and the Docker container.

So let's get started and focus on building the front end first.

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

Kubernetes
* Q; How do we scale containers?
* Q: What if the server is full cannot run another container?
* Q: How do we balance the load between containers?
* Q: How do we do rolling updates? How we go back to a previous version if something goes wrong?

Kubernetes Pods
* smallest deployable unit
* has a unique IP address in a Kubernetes cluster
* a pod can have multiple containers but that is rather unusual.
* containers in a pod share the same volume, IP, port space
* pods can be used with other technologies like RKT

Start multiple pods for Frontend
How do we load balance between them?
How do expose it externally?

Kubernetes Services
In our application we have different functional services. So how does a service which pods to load balance? This is done using labels.
* Apply a label to all services we want to target
* Apply a selector to our services so that defines which labeled pods to target

Deployments

To avoid hardcoding IP in the frontend use ingress
 https://www.orange-networks.com/blogs/210-ingress-controller-simplified-routing-in-kubernetes

 Using ingress controller
 https://github.com/rinormaloku/k8s-mastery/tree/ingress-controller
