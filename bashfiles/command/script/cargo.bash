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
        brew install rust
        ;;
    linux* )
        # ubuntu
        if !(type curl > /dev/null 2>&1); then
            test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
            sudo apt install -y curl
        fi
        curl https://sh.rustup.rs -sSf | sh
        ;;
esac
