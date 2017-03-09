#!/bin/bash

set -a
set -e
set -u

source env-vars.sh

CONTAINERS=$(docker ps -a | grep ${DOCKER_RUN_NAME})

if [ ! -z "$CONTAINERS" ]; then
    docker rm ${DOCKER_RUN_NAME}
fi

docker run -d --name=${DOCKER_RUN_NAME} --network=${NETWORK_ID} \
    --entrypoint=${ALARM_FOLDER}/beast-alarm-server-4.1.1/scripts/${ALARM_START_SCRIPT} \
    ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME} start

