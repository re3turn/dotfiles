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
        if ! (type cargo > /dev/null 2>&1); then
            bash ${SCRIPTDIR}/cargo.bash
        fi
        cargo install ${CMD}
        ;;
esac
