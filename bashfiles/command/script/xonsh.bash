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
        brew install python
        ;;
    linux* )
        # ubuntu
        test ${APT_UPDATE} -eq 0 && APT_UPDATE=1; sudo apt update
        sudo apt-get install python3 python-pip
        ;;
esac

# GOPATH
sudo pip3 install   xonsh \
                    prompt_toolkit \
                    Pygments \
                    ProcTitle \
                    gnureadline

