#!/bin/bash

umask 022

BIN_TAR=/usr/bin/gtar
BIN_UNAME=/usr/bin/uname

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
package_file_name=sensu-`${BIN_UNAME} -s`-`${BIN_UNAME} -r`.tgz

cd ${HOME}

${BIN_TAR} tzf target/${package_file_name} app etc log run
if [ ${?} -eq 0 ]; then
   echo "Success"
else
   echo "Failed (err code = {$?})"
fi
