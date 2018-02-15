#!/usr/bin/bash

# Build Prometheus exporters

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir
BIN_GO=/opt/local/bin/go
BIN_CP=/usr/bin/cp
BIN_CHMOD=/usr/bin/chmod

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH

for exporter in `${BIN_CAT} buildscripts/prometheus_exporters`; do
   ${BIN_GO} get ${exporter}
   ${BIN_GO} build ${exporter}
   ${BIN_GO} install ${exporter}
done

${BIN_CP} ${HOME}/go/bin/* ${HOME}/app/bin/prometheus/.
${BIN_CHMOD} 0755 ${HOME}/app/bin/prometheus/*
