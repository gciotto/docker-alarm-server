#
# Docker image for BEAST Alarm Server
#
# Author: Gustavo Ciotto Pinton
# LNLS - Brazilian Synchrotron Light Source Laboratory
#

FROM openjdk:latest

MAINTAINER Gustavo Ciotto

### Environment variables used by the image ###
# Github environment variables
ENV GITHUB_ALARM_REPO https://github.com/ControlSystemStudio/org.csstudio.alarmserver.product.git
ENV GITHUB_ALARM_BRANCH master

# Alarm operation-related variables
ENV ALARM_FOLDER /opt/lnls-alarm-server
ENV ALARM_START_SCRIPT docker-alarm-init
ENV ALARM_VERSION beast-alarm-server-4.1.1

# Update image and install required packages
RUN apt-get -y update
RUN apt-get install -y maven git openjdk-8-jdk

# user root is required to install all needed packages
USER root

# create new folder and copy all scripts
RUN mkdir -p ${ALARM_FOLDER}/build/scripts/

COPY scripts/setup-beast.sh \
     ${ALARM_FOLDER}/build/scripts/

WORKDIR ${ALARM_FOLDER}/build/scripts/

# Clone and compile alarm source code
RUN ./setup-beast.sh
        
WORKDIR ${ALARM_FOLDER}/${ALARM_VERSION}

# Copy provided configuration file
COPY configuration/LNLS-CON.ini \
     ./configuration/

RUN mkdir ./scripts
RUN mkdir ./log

COPY scripts/start-beast.sh \
     scripts/alarm-service \ 
     scripts/

WORKDIR ${ALARM_FOLDER}/${ALARM_VERSION}/

CMD ["sh", "-c", "${ALARM_FOLDER}/${ALARM_VERSION}/scripts/alarm-service start"]
