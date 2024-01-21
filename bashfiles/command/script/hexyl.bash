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
        brew install ${CMD}
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE:-0} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y ${CMD}
        ;;
esac
