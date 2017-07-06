#!/bin/sh

#
# A script to clone and build the alarm server application.
#
# Gustavo Ciotto Pinton
# Controls Group - Brazilian Synchrotron Light Source Laboratory
#

TMP_FOLDER=org.csstudio.alarmserver.product

git clone --branch=${GITHUB_ALARM_BRANCH} ${GITHUB_ALARM_REPO} ${TMP_FOLDER}

# Compile alarm server via Maven
( cd ${TMP_FOLDER} && mvn clean install )

# Copy and remove compiled binaries
cp -R ./${TMP_FOLDER}/repository/target/products/beast-alarm-server/linux/gtk/x86_64/${ALARM_VERSION} ${ALARM_FOLDER}
rm -r ./${TMP_FOLDER}

# Remove maven repositories and packages
rm -r ~/.m2
