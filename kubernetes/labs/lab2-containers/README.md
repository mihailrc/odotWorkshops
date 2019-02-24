#### Building Docker images

So far we focused on using Docker as a development environment and hopefully saw the advantages of doing so. The next step is to package and deploy the application. In traditional applications we create a package and then deploy to some server. With Docker we don't need to do that. Instead of packaging the application we build a Docker image that contains the package.

Docker images are build by reading the instructions from a Dockerfile.

docker build command builds an image form a Dockerfile and a context. The build context is the set of files at a specific location or path. The context is processed recursively so it includes any subdirectories. The build is run by the Docker daemon and it starts by sending the entire context to the daemon.

Explain the following:
* Dockerfile
* building an image
* .dockerignore
* docker repository

#### Building front end image

#### Building webapp image

#### Building logic layer image
