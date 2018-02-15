#!/usr/bin/bash

# Delete sensu service

/usr/sbin/svcadm disable svc:/site/sensu-client:default
/usr/sbin/svccfg delete svc:/site/sensu-client:default
/bin/rm -f /var/svc/manifest/site/sensu-client.xml

