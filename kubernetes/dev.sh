#!/usr/bin/env bash
CONTAINER_NAME=$1
PORT=$2
DIRECTORY=$3
IMAGE=$4

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 CONTAINER_NAME PORT DIRECTORY IMAGE" >&2
  exit 1
fi

if [ "$(docker ps -a | grep ${CONTAINER_NAME})" ]; then
  echo "Attaching to existing container"
  docker start ${CONTAINER_NAME}
  docker exec -it ${CONTAINER_NAME} bash
else
  echo "Starting a new container"
  docker run --name ${CONTAINER_NAME} -it -p ${PORT}:${PORT} -v $(pwd)/k8s-mastery/${DIRECTORY}:/code -w /code --entrypoint /bin/bash ${IMAGE}
fi
