#!/bin/sh

set -e

COPY_SCRIPTS_ONLY=${COPY_SCRIPTS_ONLY:-"false"}

if [ COPY_SCRIPTS_ONLY = "true" ]; then
    echo "### Copying scripts to ${HOME}/scripts/bin"
    cp -R /scripts/bin "${HOME}"/.
else
    sh -c "$*"
fi
