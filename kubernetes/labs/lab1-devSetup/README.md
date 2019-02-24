## Chapter 1 - Setting up the development environment

### Motivation
For me the simplest way of thinking about Agile is take a small step towards solving a problem, learn from it, take the next step. To be Agile our development process has to enable quick feedback loops and one such enabler is a lightweight development environment.

### Goals
* Lightweight development and build environment that can be reproduced easily and reliably
* Does not interfere with development tools running on the host computer

**Dependencies:**
* python3 and pip for sa-logic
* mvn and java for sa-webapp
* node and npm for sa-frontend

**Options:**
1. Create install script(s) that will be executed on the development workstation
2. Use existing Docker images or create custom Docker images with dependencies installed

**Pros and Cons**
* Let's find these together but think about the following
 * How do we handle configuration drift? What happens when tool versions change?
 * How easy is to recreate this environment on a different host? Do I need special permissions?

For this lab we are going to use Docker images that are available on DockerHub. This lab has shell scripts to run a Docker container for each of the components. Let's review the scripts first.

To run the containers execute the following commands
```

./logicDev.sh
cd sa
python -m pip install -r requirements.txt
python -m textblob.download_corpora
python sentiment_analysis.py

#in another terminal - note the IP of logic_dev container
docker network inspect bridge

./webDev.sh
cd target
java -jar sentiment-analysis-web-0.0.1-SNAPSHOT.jar
     --sa.logic.api.url=http://logic_dev_ip:5000

#in another terminal
./frontEndDev.sh
#npm install - this is pretty slow so I only run it the first time or when adding new libraries
npm start     

```
