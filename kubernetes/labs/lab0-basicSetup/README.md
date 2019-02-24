## Chapter 0 - Let's get started!

Now the saga begins ...

I am not going to bore you with creating an MVC application. As a starting point we are going to use an application that is already split into 3 components. For most of this workshop I am going to follow this [excellent introduction to Kubernetes](https://medium.freecodecamp.org/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882)

Download the following repository

```
#cd to kubernetes directory

git clone https://github.com/rinormaloku/k8s-mastery.git
```

The application consists of 3 components
* SA-Frontend serves React JS files
* SA-WebApp handles request from front end
* SA-Logic performs sentiment analysis
