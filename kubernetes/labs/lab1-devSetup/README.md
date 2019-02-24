## Lab 1 - Setting up the Development Environment

### Goals
* Lightweight build environment that can be reproduced easily and reliably
* Does not interfere with development tools running on the development workstation

**Dependencies:**
* python3, pip, python libraries for sa-logic
* mvn, java for sa-webapp
* node, npm and JavaScript libraries for sa-frontend

**Options:**
1. Install script(s) executed on the development workstation
2. Existing or custom Docker images with dependencies installed

** Pros and Cons **
* Let's find these together but think about the following
 * How do we handle configuration drift? What happens when tool versions change?
 * How easy is to recreate this environment on a different workstation? Do I need special permissions?

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
