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
        brew install pyenv
        mkdir -p ${HOME}/.pyenv
        ;;
    linux* )
        # ubuntu
        git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv
        ;;
esac

