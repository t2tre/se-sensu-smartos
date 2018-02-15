#!/usr/bin/bash

# Wrapper script for starting/stopping sensu. Intended to be called from svcadm
SENSU_HOME=`/usr/bin/su - sensu -c "/bin/bash -c \"export\"" | egrep "declare -x HOME" | cut -f 2 -d = | sed -e 's/\"//g'`

case "${1}" in
'start')
   /usr/bin/su -  sensu -c ${SENSU_HOME}/app/init/start_sensu_client.sh
   ;;
'stop')
   /usr/bin/su -  sensu -c ${SENSU_HOME}/app/init/stop_sensu_client.sh
   ;;
*)
   echo "Usage: ${0} (start|stop)"
   exit 1;
   ;;
esac
