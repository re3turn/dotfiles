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
        brew install neovim
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt update
        sudo apt install -y neovim \
                         python-dev python-pip python3-dev python3-pip \
                         xclip xsel
        ;;
esac

