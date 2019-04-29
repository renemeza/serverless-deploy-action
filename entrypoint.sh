#!/bin/sh

set -e

COPY_SCRIPTS_ONLY=${COPY_SCRIPTS_ONLY:-"false"}

if [ COPY_SCRIPTS_ONLY = "true" ]; then
    cp -R /scripts/bin "${HOME}"/.
else
    sh -c "$*"
fi
