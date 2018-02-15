#!/usr/bin/bash

# Reset build folders

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir

FOLDER_LIST="log run etc app app/bin app/sbin app/vendor"

echo "Resetting build folders..."
for folder in ${FOLDER_LIST}; do
   echo "Resetting ${HOME}/${folder}"
   ${BIN_RM} -rf ${HOME}/${folder}
   ${BIN_MKDIR} ${HOME}/${folder}
done
