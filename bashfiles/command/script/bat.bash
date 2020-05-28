#!/bin/bash

set -u
SCRIPTDIR=$(cd $(dirname $0); pwd)
SCRIPTNAME=${0##*/}
CMD=${SCRIPTNAME%%.*}

if (type batcat > /dev/null 2>&1); then
    exit
fi

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
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y ${CMD}
        ;;
esac

if (type batcat > /dev/null 2>&1); then
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi

