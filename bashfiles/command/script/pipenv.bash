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
        brew install pipenv
        ;;
    linux* )
        # ubuntu
        pip show pip | grep Location | grep python3 > /dev/null
        if [ $? -eq 0 ]; then
            PIP=pip
        else
            PIP=pip3
        fi
        ${PIP} install --user pipenv
        ;;
esac

