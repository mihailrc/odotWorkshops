## Microservices, Docker, Kubernetes

#### Story

10 years ago we were tasked with writing a web application that performs sentiment analysis. This application takes as input one sentence and says whether the sentence is saying something positive or something negative. Back then everybody was building traditional server side MVC applications so we did the same thing and picked Spring MVC to develop our application.

Fast forward 5 years and now everybody builds Single Page Web applications and obviously want their applications to look good on Mobile Devices. So how do we adapt to this new world? Well ... we can still use Spring MVC for the back end but now the functionality needs to be exposed via REST endpoints instead of serving HTML content. These REST endpoints are in turn used by our new shiny React Front end, that uses Bootstrap to handle Responsive Web Design for us.

Fast forward another 2 years and now every problem is a Machine Learning problem so everybody needs to use ML or DL to look cool. The problem is that that we need to use Python to benefit from the best ML libraries. Now our application has JavaScript on the front end, Java on the Web serving layer and Python on the back end. The application evolved from using Java across the entire stack to using 3 distinct technologies maintained by 3 distinct teams working across 3 different continents. Now we need to figure out how to develop and deploy these components independently.

Because of the new Machine Learning library our application became an instant success and we need to scale it up. From an initial benchmarking it seems that the sentiment analysis component needs to scale by a factor of 10 but the Spring MVC piece only needs to scale by a factor of 3. Besides we cannot have downtime anymore. So we need to figure out how to scale each of these components independently and also how to avoid having downtime.

This are the problems that we will try to solve during this workshop. 

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





https://medium.freecodecamp.org/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882

Application
* micro services based application that does sentiment analysis
* SA-Frontend serves React JS files
* SA-WebApp handles request from front end
* SA-Logic performs sentiment analysis
1. Running the application on local computer
Let’s start with the front end. One option is to do development directly on the local computer but that means I will need to install multiple libraries like npm, python and so on and I don’t really like cluttering my computer. We can use a docker container that has nom installed. There are several advantages to this - like everybody using the same version of npm.
But wait - what about my development tools? They are not going to be available on the docker container and I don’t want to give this up. There is a simple way to get our cake and eat it to. We can share a volume between the local host and docker.

Best practices for running Docker and Node
https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

Dependencies:
* sa-frontend - npm
* sa-webapp jdk8 and mvn
* sa-logic python3 and pip


Running in Docker
* Create a docker container for each of the microservices
  * Build conext and .dockerignore
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
