#!/bin/bash

#
# A simple bash script to build a Docker image containing an instance of the BEAST alarm server
#
# Gustavo Ciotto Pinton
# Controls Group
#

. ./env-vars.sh

docker build -t ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME} .
