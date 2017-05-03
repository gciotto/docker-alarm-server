#!/bin/bash

set -a
set -e
set -u

source env-vars.sh

CONTAINERS=$(docker ps -a | grep ${DOCKER_RUN_NAME})

if [ ! -z ${CONTAINERS:+x} ]; then
    docker stop ${DOCKER_RUN_NAME}
    docker rm ${DOCKER_RUN_NAME}
fi

docker run -d --name=${DOCKER_RUN_NAME} --network=${NETWORK_ID} \
    ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}

docker logs -f ${DOCKER_RUN_NAME}
