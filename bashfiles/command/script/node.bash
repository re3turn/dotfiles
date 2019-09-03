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
        curl -l git.io/nodebrew | perl --setup
        ;;
esac

nodebrew install-binary latest
nodebrew use latest

