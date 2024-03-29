#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

if !(type go > /dev/null 2>&1); then
    bash ${SCRIPTDIR}/go.bash
fi

go install github.com/x-motemen/ghq@latest

