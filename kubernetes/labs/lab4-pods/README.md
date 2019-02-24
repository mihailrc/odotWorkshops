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
