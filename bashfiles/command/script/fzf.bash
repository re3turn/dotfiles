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
        brew install wget curl
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y wget curl
        ;;
esac

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings
