#!/usr/bin/bash

# Install a service for Sensu

SENSU_HOME_FOLDER=`/usr/bin/su - sensu -c "/bin/bash -c \"export\"" | egrep "declare -x HOME" | cut -f 2 -d = | sed -e 's/\"//g'`
ESC_SENSU_HOME_STR=`echo ${SENSU_HOME_FOLDER} | /usr/bin/sed -e 's/\//\\\\\//g'`

/usr/bin/cat ${SENSU_HOME_FOLDER}/app/init/sensu_client_template.xml | /usr/bin/sed -e "s/SENSU_HOME/${ESC_SENSU_HOME_STR}/g" > /var/svc/manifest/site/sensu-client.xml
/usr/bin/chmod 0644 /var/svc/manifest/site/sensu-client.xml
/usr/sbin/svccfg validate /var/svc/manifest/site/sensu-client.xml
if [ ${?} -eq 0 ]; then
   /usr/sbin/svccfg import /var/svc/manifest/site/sensu-client.xml
   /usr/sbin/svcadm restart manifest-import
else
   exit_code=${?}
   echo "Failed to import service manifest (exit code=${exit_code})"
   exit ${exit_code}
fi
