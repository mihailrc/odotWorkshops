## Chapter 4 - Kubernetes Basics - Container Orchestration
The moment our application consists of multiple micro-service we have to start thinking about Container Orchestration. Docker Compose is a good start especially for local deployments but the gold standard is Kubernetes. This will be our focus for the rest of this workshop and and I am going to show you how Kubernetes helps us solve some really complex problems.

Kubernetes is complex but you don't need to know everything to get started. I hope this is going to provide an understanding of the main  concepts and how they fit together.

For our application Kubernetes helps us answer the following questions:
* How do we scale individual components of our application?
* How can we distribute the load across multiple physical servers?
* What happens if a server is full and cannot run another container?
* How do we balance the load between containers?
* How do we ensure fault tolerance?
* How do we do zero downtime deploy?
* How do we revert back to the previous version when something goes wrong?

### Kubernetes Components

#### Master Components
Master components make global decisions about the cluster and are responsible for detecting and responding to cluster events such as restarting pods when necessary, controlling workloads across worker nodes and so on. Master components can be run on any machine in the cluster but typically they run on dedicated machines.

The **API Server** is a Master Component that acts as the front end to the Kubernetes Cluster. Communication with the API Server happens via a client application called **kubectl**.

#### Worker Nodes
Master components manage a number of worker nodes. Worker nodes have an agent named **kubelet** that communicates with the API Server and manages the **pods** within the node. Each worker can run multiple pods.

#### Pods
* smallest deployable unit
* have a unique IP address in a Kubernetes cluster
* a pod can have multiple containers but that is rather unusual.
* containers in a pod share the same volume, IP and port space

#### Minikube
Minikube is a local Kubernetes cluster that has a single worker node. It allows us to experiment with Kubernetes and learn about most of its features.

For the rest of this workshop I am assuming minikube is installed. To start it run ```minikube start```
