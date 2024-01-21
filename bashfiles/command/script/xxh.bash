#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

echo "#########################################"
echo "# Install ${CMD}"
echo "#########################################"

case ${OSTYPE} in
    darwin* )
        # mac
        brew install xxh
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE:-0} -eq 0 && APT_UPDATE=1; sudo apt update
        if ! (type pip3 > /dev/null 2>&1); then
            sudo apt install python3-pip
        fi
        pip3 install --user xxh-xxh
        ;;
esac

