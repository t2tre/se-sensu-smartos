#!/bin/bash

mask 022

BIN_TAR=/usr/bin/gtar
BIN_UNAME=/usr/bin/uname

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
package_file_name=sensu-`${BIN_UNAME} -s`-`${BIN_UNAME} -r`.tgz

cd ${HOME}

${BIN_TAR} tvzf target/${package_file_name} app etc log run
