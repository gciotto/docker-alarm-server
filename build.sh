#!/bin/bash

source env-vars.sh

docker build -t ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME} .
