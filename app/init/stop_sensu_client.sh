#!/usr/bin/env bash

# Stop the Sensu Client

BIN_KILL=/usr/bin/kill
BIN_STAT=/usr/bin/stat
BIN_CAT=/usr/bin/cat

# Default settings, can be overridden in ${HOME}/etc/sensu/sensu.env
export PATH=${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
PID_FILE=${HOME}/run/sensu-client.pid

if [ -f ${HOME}/etc/sensu/sensu.env ]; then
   . ${HOME}/etc/sensu/sensu.env
fi

if [ -f ${PID_FILE} ] && [ `${BIN_STAT} --printf=%s ${PID_FILE}` -gt 0 ]; then
   echo "Stopping sensu client.."
   ${BIN_KILL} `${BIN_CAT} ${PID_FILE}`
   exit_code=${?}
else
   echo "Pidfile not found"
   exit_code=20
fi

exit ${exit_code}
