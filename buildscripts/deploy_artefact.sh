#!/bin/bash

umask 022

BIN_TAR=/usr/bin/gtar
BIN_UNAME=/usr/bin/uname
BIN_CURL=/opt/local/bin/curl

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
package_file_name=sensu-`${BIN_UNAME} -s`-`${BIN_UNAME} -r`.tgz
deployment_url="${ARTIFACTORY_URL}/sensu/BUILD_${BUILD_ID}/${package_file_name}"

cd ${HOME}

echo "${BIN_CURL} -H \"X-JFrog-Art-Api: ${APIKEY}\" -T target/${package_file_name} ${deployment_url}"

