#!/bin/sh

set -e

COPY_SCRIPTS=${COPY_SCRIPTS:-"false"}

if [ COPY_SCRIPTS = "true" ]; then
    cp -R /scripts/bin "${HOME}"/.
else
    sh -c "$*"
fi
