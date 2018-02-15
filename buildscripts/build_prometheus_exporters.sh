#!/usr/bin/bash

# Build Prometheus exporters

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir
BIN_GO=/opt/local/bin/go
BIN_CP=/usr/bin/cp
BIN_CHMOD=/usr/bin/chmod

export PATH=${HOME}/go/bin:${HOME}/app/bin:${HOME}/app/sbin:/opt/local/sbin:/opt/local/bin:$PATH

${BIN_GO} get github.com/oliver006/redis_exporter
${BIN_GO} build github.com/oliver006/redis_exporter
${BIN_GO} install github.com/oliver006/redis_exporter

${BIN_CP} ${HOME}/go/bin/* ${HOME}/app/bin/prometheus/.
${BIN_CHMOD} 0755 ${HOME}/app/bin/prometheus/*
