#!/bin/bash

set -a
set -e
set -u

source ./env-vars.sh

apt-get -y update
apt-get install -y maven git openjdk-8-jdk
