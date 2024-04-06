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
        curl -L https://git.io/vQhTU | bash -s -- --version 1.22.2
        ;;
esac

# GOPATH
mkdir -p ~/go

