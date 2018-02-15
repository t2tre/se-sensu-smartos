#!/usr/bin/bash

# Build Sensu and associated plugins

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir
BIN_BUNDLER=/opt/local/bin/bundler
BIN_CP=/usr/bin/cp

${BIN_CP} -Rp app/* ${HOME}/app/.
${BIN_CP} -Rp sensu ${HOME}/etc/.
cd ${HOME}/app

${BIN_BUNDLER} install --path vendor/bundler
${BIN_BUNDLER} install --binstubs