#!/bin/bash

umask 022

BIN_TAR=/usr/bin/gtar
BIN_UNAME=/usr/bin/uname
BIN_CURL=/opt/local/bin/curl
BIN_SHASUM=/opt/local/bin/shasum
BIN_MD5SUM=/ec/bin/md5sum

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH
package_file_name=sensu-`${BIN_UNAME} -s`-`${BIN_UNAME} -r`.tgz
deployment_url="${ARTIFACTORY_URL}/sensu/BUILD_${BUILD_ID}/${package_file_name}"

cd ${HOME}

SHA1SUM=$(${BIN_SHASUM} -a 1 target/${package_file_name} | awk '{print $1}')
SHA256SUM=$(${BIN_SHASUM} -a 256 target/${package_file_name} | awk '{print $1}')
MD5SUM=$(${BIN_MD5SUM} target/${package_file_name} | awk '{print $1}')

${BIN_CURL} -XPUT \
   -H "X-JFrog-Art-Api: ${APIKEY}" \
   -H "X-Checksum-Md5: ${MD5SUM}" \
   -H "X-Checksum-Sha1: ${SHA1SUM}" \
   -H "X-Checksum-Sha256: ${SHA256SUM}" \
   -T target/${package_file_name} ${deployment_url}

# ${BIN_CURL} -XPUT -H \"X-JFrog-Art-Api: ${APIKEY}\" -T target/${package_file_name} ${deployment_url}

