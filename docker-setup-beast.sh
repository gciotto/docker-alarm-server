#!/bin/sh

. ./env-vars.sh

git clone --branch=${GITHUB_ALARM_BRANCH} ${GITHUB_ALARM_REPO}

cd org.csstudio.alarmserver.product/

mvn clean install
