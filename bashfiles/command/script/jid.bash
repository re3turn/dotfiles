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
        if !(type ghg > /dev/null 2>&1); then
            bash ${SCRIPTDIR}/ghg.bash
        fi
        ghg get simeji/jid
        ;;
esac

