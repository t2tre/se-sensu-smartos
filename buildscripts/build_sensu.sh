#!/usr/bin/bash

# Build Sensu and associated plugins

umask 022

BIN_RM=/usr/bin/rm
BIN_MKDIR=/usr/bin/mkdir
BIN_BUNDLER=/opt/local/bin/bundler
BIN_CP=/usr/bin/cp

cp -Rp app/* ${HOME}/app/.
cd ${HOME}/app

${BIN_BUNDLER} install --path vendor/bundler
${BIN_BUNDLER} install --binstubs