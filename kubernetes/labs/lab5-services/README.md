

#### Services
How do we load balance between them?

In our application we have different functional services. So how does a service which pods to load balance? This is done using labels.
* Apply a label to all services we want to target
* Apply a selector to our services so that defines which labeled pods to target
