# Docker container for BEAST Alarm Server

# Author: Gustavo Ciotto Pinton
# LNLS - Brazilian Synchrotron Light Source Laboratory

FROM debian:stretch

MAINTAINER Gustavo Ciotto

# user root is required to install all needed packages
USER root

ENV ALARM_FOLDER /opt/lnls-alarm-server

# create new folder and copy all scripts
RUN mkdir -p ${ALARM_FOLDER}/build/scripts/

COPY docker-update.sh \
     docker-setup-beast.sh \
     env-vars.sh \
     ${ALARM_FOLDER}/build/scripts/

WORKDIR ${ALARM_FOLDER}/build/scripts/

RUN ./docker-update.sh

RUN ./docker-setup-beast.sh

RUN cp -R ./org.csstudio.alarmserver.product/repository/target/products/beast-alarm-server/linux/gtk/x86_64/beast-alarm-server-4.1.1 /opt/lnls-alarm-server && \
    rm -r ./org.csstudio.alarmserver.product
        
WORKDIR ${ALARM_FOLDER}/beast-alarm-server-4.1.1

COPY configuration/LNLS-CON.ini \
     ./configuration/

RUN mkdir ./scripts
RUN mkdir ./log

COPY docker-start-beast.sh \
     docker-alarm-init \ 
     scripts/

CMD ["/opt/lnls-alarm-server/beast-alarm-server-4.1.1/scripts/docker-alarm-init", "start"]

WORKDIR /
