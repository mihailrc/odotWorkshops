
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
