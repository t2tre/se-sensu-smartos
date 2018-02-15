#!/usr/bin/bash

# Reset build folders

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir

FOLDER_LIST="~sensu/log ~sensu/run ~sensu/etc ~sensu/app ~sensu/app/bin ~sensu/app/sbin ~sensu/app/vendor"

echo "Resetting build folders..."
for folder in ${FOLDER_LIST}; do
   echo "Resetting ${folder}"
   ${BIN_RM} -rf ${folder}
   ${BIN_MKDIR} ${folder}
done
