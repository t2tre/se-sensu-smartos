#!/usr/bin/bash

# Reset build folders

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir

FOLDER_LIST="~sensu/log ~sensu/run ~sensu/etc ~sensu/app ~sensu/app/bin ~sensu/app/sbin ~sensu/app/vendor"
FOLDER_LIST="log run etc app app/bin app/sbin app/vendor"

echo "Resetting build folders..."
for folder in ${FOLDER_LIST}; do
   echo "Resetting ${folder}"
   ${BIN_RM} -rf ${HOME}/${folder}
   ${BIN_MKDIR} ${HOME}/${folder}
done
