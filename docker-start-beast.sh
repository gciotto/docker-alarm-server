#!/bin/bash

DIR=/opt/lnls-alarm-server/beast-alarm-server-4.1.1
PROGRAM=AlarmServer

LOGFILE=${DIR}/log/${PROGRAM}`date +'_%Y-%m-%d_%H:%M:%S'`.log
DATA=/tmp/${PROGRAM}.$$
INI=${DIR}/configuration/LNLS-CON.ini

OPT="-data ${DATA} -pluginCustomization ${INI} -consoleLog -vmargs -Djava.awt.headless=true -Xms64m -Xmx256m"

echo "Starting alarm server with ${DIR}/${PROGRAM} ${OPT}"

${DIR}/${PROGRAM} ${OPT}
