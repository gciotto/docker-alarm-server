#!/bin/bash

DOCKER_MANTAINER_NAME=gciotto
DOCKER_NAME=alarm-server
DOCKER_RUN_NAME=alarm-server

GITHUB_ALARM_REPO=https://github.com/ControlSystemStudio/org.csstudio.alarmserver.product.git
GITHUB_ALARM_BRANCH=master

ALARM_FOLDER=/opt/lnls-alarm-server
ALARM_START_SCRIPT=docker-alarm-init

NETWORK_ID=alarm-server-internal-network
