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
        brew install nodebrew
        nodebrew setup
        ;;
    linux* )
        # ubuntu
        wget git.io/nodebrew
        perl nodebrew setup
        rm -f nodebrew
        ;;
esac

nodebrew install-binary latest
nodebrew use latest

