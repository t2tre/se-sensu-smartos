#!/bin/bash

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir
BIN_CP=/usr/bin/cp
BIN_CHMOD=/usr/bin/chmod
BIN_TAR=/usr/bin/gtar
BIN_UNAME=/usr/bin/uname
BIN_ECHO=/usr/bin/echo

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
package_file_name=sensu-`${BIN_UNAME} -s`-`${BIN_UNAME} -r`.tgz

cd ${HOME}

# Set perms for some files before packaging
${BIN_CHMOD} 0755 app/init/* app/sbin/*
${BIN_CHMOD} 0644 app/init/sensu_client_template.xml

${BIN_MKDIR} -p target
${BIN_ECHO} ${BUILD_ID} > BUILD_NUMBER.txt
${BIN_TAR} cpzf target/${package_file_name} app etc log run BUILD_NUMBER.txt
