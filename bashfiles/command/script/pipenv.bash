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
        if !(type pipx > /dev/null 2>&1); then
          bash ${SCRIPTDIR}/pipx.bash
        fi
        pipx install pipenv
        ;;
esac

