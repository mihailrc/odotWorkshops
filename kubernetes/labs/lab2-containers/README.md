## Chapter 2 - Docker - It's all about containers

So far we focused on using Docker as a development environment and hopefully saw the advantages of doing so. The next step is to package and deploy the application. In traditional applications we create a package and then deploy to a server. With Docker we don't need to do that. Instead of packaging the application we build a Docker image that contains all that is required to run the application.

*"A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings." - [from Docker Site](https://www.docker.com/resources/what-container)*

#### Docker Images
Docker images are built by the Docker daemon that uses two inputs, instructions provided by a Dockerfile and a build context specified by a path. The context is processed recursively so it includes any subdirectories. When the build starts the entire context is send to the daemon.

#### Building the Docker image for the Front End
The Front End is Single Page Application built with React. It consists of Java Script code that makes REST calls to a WebServer. The front end itself consists of static files that can be served by a web server like Nginx.

```
#cd to lab1-devSetup directory
#start a shell into the Docker container for Front End development
frontEndDev.sh
#build the package for production
npm run build
#exit the shell

# in a separate terminal
#from lab2-containers
docker build -f Dockerfile-frontend -t mihailrc/sa-frontend ../../k8s-mastery/sa-frontend/
```
Note the following line as the images is being built?

```Sending build context to Docker daemon  146.2MB```

This seems a like a lot of data is being sent for something that should be a small Java Script application. What is going on?
Hint: build context

We can reduce the size of files being sent to Docker daemon using .dockerignore It is very similar with how .gitignore works.

#### Docker Registry
Great - we have a docker image that we can build efficiently but how can we share it? This is where Docker registry comes into play. In our case we are using DockerHub as our Docker registry. A free DockerHub account is required to publish images. Once the account is created and credentials set up on the command line `docker login -u mihailrc -p wouldntYouLikeToKnowIt?` from the command line, we can publish images with

```docker push mihailrc/sa-frontend```

Anyone can now pull this image

```docker pull mihailrc/sa-frontend```

#### Building the WebApp Image

```
#from lab2-containers directory execute
docker build -f Dockerfile-webapp -t mihailrc/sa-webapp ../../k8s-mastery/sa-webapp/
docker push mihailrc/sa-webapp
```

#### Building the Logic Layer Image
```
#from lab2-containers directory execute
docker build -f Dockerfile-logic -t mihailrc/sa-logic ../../k8s-mastery/sa-logic/
docker push mihailrc/sa-logic
```

#### Running the application
```
#assumes the images were already pulled. If not you know what to do
# logic
docker run -d -p 5000:5000 mihailrc/sa-logic
#web app
#find out the IP address of the logic docker container so it can be passed to webapp container
docker network inspect bridge
docker run -d -p 8080:8080 -e SA_LOGIC_API_URL='http://<logic_container_ip>:5000' mihailrc/sa-webapp
#front end
docker run -d -p 80:80 mihailrc/sa-frontend
```
