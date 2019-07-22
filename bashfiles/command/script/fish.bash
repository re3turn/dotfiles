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
        brew install fish
        ;;
    linux* )
        # ubuntu
        sudo apt-add-repository ppa:fish-shell/release-3
        sudo apt-get update
        sudo apt-get install fish
        ;;
esac

