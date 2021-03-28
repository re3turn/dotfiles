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
        brew install go
        ;;
    linux* )
        # ubuntu
        export GOPATH=${HOME}/go
        export GOROOT=${HOME}/.go
        curl -L https://git.io/vQhTU | bash
        ;;
esac

# GOPATH
mkdir -p ~/.go

