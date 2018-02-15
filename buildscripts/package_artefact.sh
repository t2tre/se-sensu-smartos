#!/bin/bash

mask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir
BIN_CP=/usr/bin/cp
BIN_CHMOD=/usr/bin/chmod
BIN_TAR=/usr/bin/gtar
BIN_UNAME=/usr/bin/uname

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
package_file_name=sensu-`${BIN_UNAME} -s`-`${BIN_UNAME} -r`.tgz

cd ${HOME}

${BIN_MKDIR} -p target
${BIN_TAR} cvpzf target/${package_file_name} app etc log run
