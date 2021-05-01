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
        if !(type go > /dev/null 2>&1); then
            bash ${SCRIPTDIR}/go.bash
        fi
        go get -u github.com/simeji/jid/cmd/jid
        ;;
esac

