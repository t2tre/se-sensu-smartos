#!/usr/bin/env bash

# Starts up Sensu Client

# Default settings, can be overridden in ${HOME}/etc/sensu/sensu.env
export PATH=${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
CONFIG_FOLDER=${HOME}/etc/sensu/conf.d
PID_FILE=${HOME}/run/sensu-client.pid
LOG_FILE=${HOME}/log/sensu-client.log
LOG_LEVEL=info

if [ -f ${HOME}/etc/sensu/sensu.env ]; then
   . ${HOME}/etc/sensu/sensu.env
fi

${HOME}/app/bin/bundle exec ${HOME}/app/bin/sensu-client -b \
  -d ${CONFIG_FOLDER} \
  -p ${PID_FILE} \
  -l ${LOG_FILE} \
  -L ${LOG_LEVEL}
